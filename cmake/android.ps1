param(
  [ValidateSet("legacy","modern")] [string]$Mode = "legacy",
  [switch]$UseGcc,
  [string]$BuildRoot,
  [string]$FMODLibDir
)

$ErrorActionPreference = "Stop"

function Ask($prompt, $default="") {
  if ($default -ne "") { $p = "$prompt [$default]" } else { $p = $prompt }
  Read-Host $p | ForEach-Object { if ($_ -eq "" -and $default -ne "") { $default } else { $_ } }
}

function SelectFromList([string]$Title, [string[]]$Options, [bool]$Multi=$true, [int[]]$DefaultIdxs=@()) {
  Write-Host "`n$Title" -ForegroundColor Cyan
  for ($i=0; $i -lt $Options.Count; $i++) { Write-Host ("  {0}. {1}" -f ($i+1), $Options[$i]) }
  if ($Multi) {
    $def = ($DefaultIdxs | ForEach-Object { ($_+1) }) -join ','
    $ans = Read-Host ("Choose one or more (comma separated) [$def]")
    if ([string]::IsNullOrWhiteSpace($ans)) { $ans = $def }
    $idxs = $ans.Split(',') | ForEach-Object { $_.Trim() } | Where-Object { $_ } | ForEach-Object { [int]$_ - 1 }
    return ($idxs | ForEach-Object { if ($_ -ge 0 -and $_ -lt $Options.Count) { $Options[$_] } })
  } else {
    $def = 1
    if ($null -ne $DefaultIdxs -and $DefaultIdxs.Count -gt 0) { $def = $DefaultIdxs[0] + 1 }
    $ans = Read-Host ("Choose one [$def]")
    if ([string]::IsNullOrWhiteSpace($ans)) { $ans = "$def" }
    $i = [int]$ans - 1
    if ($i -lt 0 -or $i -ge $Options.Count) { throw "Invalid selection" }
    return @($Options[$i])
  }
}

# Produce a relative path (../ style) from Base to Target for nicer prompts/logs
function Rel([string]$Base, [string]$Target){
  try {
    $baseUri = New-Object System.Uri((Abs $Base) + [IO.Path]::DirectorySeparatorChar)
    $tgtUri  = New-Object System.Uri((Abs $Target))
    $relUri  = $baseUri.MakeRelativeUri($tgtUri)
    return [Uri]::UnescapeDataString($relUri.ToString()).Replace('/', '\')
  } catch { return $Target }
}

function Abs($p){
  try {
    if ([string]::IsNullOrWhiteSpace($p)) { return (Get-Location).Path }
    if ([IO.Path]::IsPathRooted($p)) {
      return [IO.Path]::GetFullPath($p)
    }
    $base = (Get-Location).Path
    return [IO.Path]::GetFullPath((Join-Path -Path $base -ChildPath $p))
  } catch {
    # Fallback: return input as-is to avoid hard failure
    return $p
  }
}

# Repo roots
$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Abs (Join-Path $ScriptRoot "..")
$ContribPath = Abs (Join-Path $RepoRoot "Contribs")

# Explicitly record CMake source dir (root) and verify Android/libroblox sources exist
$SourceDir = $RepoRoot
$AndroidLibrobloxDir = Abs (Join-Path $RepoRoot "Android\libroblox")
if (Test-Path (Join-Path $AndroidLibrobloxDir "JNIMain.cpp")) {
  $relLibroblox = Rel $ScriptRoot $AndroidLibrobloxDir
  Write-Host ("Using Android JNI sources from: {0}" -f $relLibroblox) -ForegroundColor Cyan
} else {
  Write-Warning "Could not find Android/libroblox/JNIMain.cpp under repo root. Ensure your checkout includes Android/libroblox."
}
# Allow caller to choose build output root (e.g., another drive)
if ([string]::IsNullOrWhiteSpace($BuildRoot)) {
  $defaultBuildRootAbs = Abs (Join-Path $RepoRoot "Android\build")
  # Show ../ relative to cmake/ folder
  $defaultBuildRootRel = Rel $ScriptRoot $defaultBuildRootAbs
  $answer = Ask "Enter Build Root directory" $defaultBuildRootRel
  if ([string]::IsNullOrWhiteSpace($answer)) {
    $BuildRoot = $defaultBuildRootAbs
  } else {
    # Interpret relative answers against cmake/ folder to honor ../ style
    $BuildRoot = Abs (Join-Path $ScriptRoot $answer)
  }
} else {
  $BuildRoot = Abs $BuildRoot
}
$AndroidApp = Abs (Join-Path $RepoRoot "Android/NativeShell")

# Ensure build root exists
if (-not (Test-Path $BuildRoot)) {
  New-Item -ItemType Directory -Force -Path $BuildRoot | Out-Null
}

# Detect Ninja
$HasNinja = (Get-Command ninja -ErrorAction SilentlyContinue) -ne $null
$DefaultGen = if ($HasNinja) { "Ninja" } else { "MinGW Makefiles" }

# Discover NDKs inside repo Toolchains (as requested)
$RepoToolchains = Join-Path $ScriptRoot "Toolchains"
$Ndks = @()
if (Test-Path $RepoToolchains) {
  Get-ChildItem -Directory $RepoToolchains | ForEach-Object {
    $dir = $_.FullName
    $modernToolchain = Join-Path $dir "build/cmake/android.toolchain.cmake"
    $hasModern = Test-Path $modernToolchain
    $Ndks += [PSCustomObject]@{ Name = $_.Name; Path = $dir; ModernToolchain = if ($hasModern) { $modernToolchain } else { $null } }
  }
}

Write-Host "Found NDK candidates under ${RepoToolchains}:" -ForegroundColor Cyan
if ($Ndks.Count -eq 0) { Write-Host "(none)" } else { $Ndks | ForEach-Object { Write-Host " - $($_.Name) -> $($_.Path)" } }

# Mode prompt (menu)
if ($PSBoundParameters.ContainsKey('Mode') -eq $false) {
  $sel = SelectFromList "Select build mode" @('legacy (API 15, old NDK)','modern (API 19/21+, new NDK)') $false @(0)
  $Mode = if ($sel -like 'legacy*') { 'legacy' } else { 'modern' }
}

# Select NDK (menu + custom)
if ($Ndks.Count -gt 0) {
  $ndkOptions = @($Ndks | ForEach-Object { $_.Name }) + @('<Enter a full path>')
  $choice = SelectFromList "Select NDK" $ndkOptions $false @(0)
  if ($choice -eq '<Enter a full path>') {
    $inp = Ask 'Enter full path to Android NDK' ''
    if (-not (Test-Path $inp)) { throw "NDK not found: $inp" }
    $NDK = Abs $inp
  } else {
    $NDK = Abs (Join-Path $RepoToolchains $choice)
  }
} else {
  $inp = Ask "Enter full path to Android NDK" "C:\\Android\\ndk"
  if (-not (Test-Path $inp)) { throw "NDK not found: $inp" }
  $NDK = Abs $inp
}

  # Quick validation of NDK contents to explain fallbacks early
  $tcRoot = Join-Path $NDK 'toolchains'
  if (-not (Test-Path $tcRoot)) {
    Write-Warning "NDK appears incomplete: missing 'toolchains' at $tcRoot. Point to a full NDK install (e.g., r16b for legacy, r25c for modern)."
  } else {
    $tcSub = Get-ChildItem -Directory -ErrorAction SilentlyContinue $tcRoot
    if (-not $tcSub -or $tcSub.Count -eq 0) {
      Write-Warning "NDK 'toolchains' has no entries at $tcRoot. This indicates a partial/bundled NDK without GCC/LLVM prebuilts; legacy GCC detection will fail and CMake may error."
    }
  }

# Export env vars expected by legacy toolchain
$env:ANDROID_NDK = $NDK
$env:ANDROID_NDK_HOME = $NDK
 # Derive a simple NDK version tag from the path (e.g., android-ndk-r16b, r18b, r21e)
 $NdkVer = ($NDK -replace '.*android-ndk-','').TrimEnd(@('/','\'))
$env:ANDROID_NDK_ROOT = $NDK
# Help legacy toolchain pick correct host prebuilt folder
if (-not $env:ANDROID_NDK_HOST) { $env:ANDROID_NDK_HOST = 'windows-x86_64' }

# API level and ABIs
if ($Mode -eq "legacy") {
  $ApiLevel = 15
  $abiOptions = @('armeabi-v7a','x86')
  $AbiList = SelectFromList "Select ABIs (legacy)" $abiOptions $true @(0)
  $ToolchainFile = Abs (Join-Path $ScriptRoot "Toolchains/android.toolchain.cmake")
  $Stl = "gnustl_static"
  $ToolchainName = "arm-linux-androideabi-4.9"
  # RBX_STL_INCLUDE_DIRS from legacy gnustl
  $RBX_STL_INCLUDE_DIRS = (
    @(
      Join-Path $NDK 'sources\cxx-stl\gnu-libstdc++\4.9\include'
      Join-Path $NDK 'sources\cxx-stl\gnu-libstdc++\4.9\include\backward'
      Join-Path $NDK 'sources\android\support\include'
    ) | ForEach-Object { if (Test-Path $_) { $_ } }
  ) -join ';'
  if (-not $RBX_STL_INCLUDE_DIRS) { Write-Warning "Could not resolve gnustl include dirs. Ensure you pointed to an old NDK (r16b/r18b)." }
}
else {
  $apiOptions = @('19 (Android 4.4.4)','21 (Android 5.0, required for 64-bit)')
  $apiSel = SelectFromList "Select minSdk (ANDROID_PLATFORM)" $apiOptions $false @(0)
  $ApiLevel = if ($apiSel.StartsWith('21')) { 21 } else { 19 }
  $abiOptions = @('armeabi-v7a','arm64-v8a','x86','x86_64')
  $AbiList = SelectFromList "Select ABIs (modern)" $abiOptions $true @(0,1)
  $ToolchainFile = Join-Path $NDK "build/cmake/android.toolchain.cmake"
  if (-not (Test-Path $ToolchainFile)) { throw "Modern toolchain not found: $ToolchainFile" }
  $Stl = "c++_static"
  # RBX_STL_INCLUDE_DIRS for llvm libc++ (best-effort; project still expects var)
  $RBX_STL_INCLUDE_DIRS = (
    @(
      Join-Path $NDK 'sources\cxx-stl\llvm-libc++\include'
      Join-Path $NDK 'sources\android\support\include'
    ) | ForEach-Object { if (Test-Path $_) { $_ } }
  ) -join ';'
}

# Normalize ABIs (dedupe)
$AbiList = @($AbiList | Select-Object -Unique)

# Build types (menu)
$btOptions = @('Release','Noopt','Debug')
$BuildTypes = SelectFromList "Select build types" $btOptions $true @(0)
$Map = @{ Release = 'release'; Noopt = 'noopt'; Debug = 'debug' }

# Generator (menu)
$genOptions = @()
if ($HasNinja) { $genOptions += 'Ninja' }
$genOptions += 'MinGW Makefiles'
$Gen = SelectFromList "Select CMake generator" $genOptions $false @(0)
if ($Gen -eq 'Ninja' -and -not $HasNinja) {
  Write-Host "Ninja not found on PATH; falling back to 'MinGW Makefiles'" -ForegroundColor Yellow
  $Gen = 'MinGW Makefiles'
}
# If MinGW Makefiles is selected, ensure mingw32-make is available; otherwise fallback to Ninja if possible
if ($Gen -eq 'MinGW Makefiles') {
  $HasMingwMake = (Get-Command mingw32-make -ErrorAction SilentlyContinue) -ne $null
  if (-not $HasMingwMake) {
    if ($HasNinja) {
      Write-Host "mingw32-make not found; switching to Ninja generator" -ForegroundColor Yellow
      $Gen = 'Ninja'
    } else {
      throw "Selected 'MinGW Makefiles' but 'mingw32-make' is not on PATH. Install Ninja or MinGW make, or select Ninja."
    }
  }
}

# Resolve make program path for reliability
$NinjaPath = $null
$MingwMakePath = $null
if ($Gen -eq 'Ninja') {
  $cmd = Get-Command ninja -ErrorAction SilentlyContinue
  if ($cmd) { $NinjaPath = $cmd.Path }
}
if ($Gen -eq 'MinGW Makefiles') {
  $cmd = Get-Command mingw32-make -ErrorAction SilentlyContinue
  if ($cmd) { $MingwMakePath = $cmd.Path }
}

Write-Host "\nSummary:" -ForegroundColor Yellow
Write-Host "  Mode:        $Mode"
# Show key paths relative to cmake/ folder for readability
$__ndkRel       = Rel $ScriptRoot $NDK
$__tcRel        = Rel $ScriptRoot $ToolchainFile
$__contribsRel  = Rel $ScriptRoot $ContribPath
$__buildRootRel = Rel $ScriptRoot $BuildRoot
Write-Host "  NDK:         $__ndkRel"
Write-Host "  Toolchain:   $__tcRel"
Write-Host "  API:         $ApiLevel"
Write-Host "  ABIs:        $(($AbiList -join ', '))"
Write-Host "  BuildTypes:  $(($BuildTypes -join ', '))"
Write-Host "  Generator:   $Gen"
Write-Host "  Contribs:    $__contribsRel"
Write-Host "  BuildRoot:   $__buildRootRel"

$jobs = $env:NUMBER_OF_PROCESSORS; if (-not $jobs) { $jobs = 4 }

foreach ($abi in $AbiList) {
  foreach ($bt in $BuildTypes) {
    $btDir = $Map[$bt]
    if (-not $btDir) { Write-Warning "Unknown build type $bt"; continue }

    # Use per-ABI build folders to avoid cross-ABI and generator cache collisions
    $outDir = Join-Path (Join-Path $BuildRoot $btDir) $abi
    if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Force -Path $outDir | Out-Null }

    Push-Location $outDir
    try {
      Write-Host "\nConfiguring: $bt / $abi" -ForegroundColor Cyan
      # Clean any previous CMake cache to avoid generator mismatch errors
      $cache = Join-Path $outDir 'CMakeCache.txt'
      $cmFiles = Join-Path $outDir 'CMakeFiles'
      if (Test-Path $cache) { Remove-Item -Force $cache -ErrorAction SilentlyContinue }
      if (Test-Path $cmFiles) { Remove-Item -Recurse -Force $cmFiles -ErrorAction SilentlyContinue }
      
      # Validate legacy toolchain presence for selected ABI (prefer GCC; allow GCC .cmd wrappers; fallback to Clang if available)
      $UsingLegacyClang = $false
      $UsingGccCmd = $false
      $GccCmdC = $null
      $GccCmdCxx = $null
      if ($Mode -eq 'legacy') {
        $ndkHost = if ($env:ANDROID_NDK_HOST) { $env:ANDROID_NDK_HOST } else { 'windows-x86_64' }
        if ($abi -like 'armeabi*') {
          $tcGcc = Join-Path $NDK ("toolchains/arm-linux-androideabi-4.9/prebuilt/$ndkHost/bin/arm-linux-androideabi-g++.exe")
          $tcAlt = Join-Path $NDK ("toolchains/arm-linux-androideabi-4.9/prebuilt/$ndkHost/arm-linux-androideabi/bin/arm-linux-androideabi-g++.exe")
          $tcGccCmd = Join-Path $NDK ("toolchains/arm-linux-androideabi-4.9/prebuilt/$ndkHost/bin/arm-linux-androideabi-g++.cmd")
          $tcGccCmdC = Join-Path $NDK ("toolchains/arm-linux-androideabi-4.9/prebuilt/$ndkHost/bin/arm-linux-androideabi-gcc.cmd")
          $gccOk = $false
          $gccExeC = $null
          $gccExeCxx = $null
          Write-Host "Checking legacy GCC toolchain:" -ForegroundColor DarkCyan
          Write-Host "  $tcGcc -> $([bool](Test-Path $tcGcc))"
          Write-Host "  $tcAlt -> $([bool](Test-Path $tcAlt))"
          Write-Host "  $tcGccCmd -> $([bool](Test-Path $tcGccCmd))"
          Write-Host "  $tcGccCmdC -> $([bool](Test-Path $tcGccCmdC))"
          if (Test-Path $tcGcc) { $gccOk = $true; $tcBinDir = Split-Path -Parent $tcGcc }
          elseif (Test-Path $tcAlt) { $gccOk = $true; $tcBinDir = Split-Path -Parent $tcAlt }
          elseif ((Test-Path $tcGccCmd) -and (Test-Path $tcGccCmdC)) { $gccOk = $true; $tcBinDir = Split-Path -Parent $tcGccCmd; $UsingGccCmd = $true; $GccCmdCxx = $tcGccCmd; $GccCmdC = $tcGccCmdC }
          if ($gccOk) {
            # Prepend toolchain bin to PATH so legacy toolchain can find it
            if ($tcBinDir -and $env:Path -notlike "*${tcBinDir}*") { $env:Path = "$tcBinDir;" + $env:Path }
            # Record gcc/g++ paths
            if ($UsingGccCmd) {
              $gccExeC = $GccCmdC
              $gccExeCxx = $GccCmdCxx
            } else {
              $gccExeC = ($tcBinDir | Join-Path -ChildPath 'arm-linux-androideabi-gcc.exe')
              $gccExeCxx = ($tcBinDir | Join-Path -ChildPath 'arm-linux-androideabi-g++.exe')
            }
            # If -UseGcc flag is set, force GCC even on r18b .cmd wrappers
            if ($UseGcc) {
              Write-Host "Forcing GCC per -UseGcc flag: C=$gccExeC, CXX=$gccExeCxx" -ForegroundColor Yellow
            } elseif ($UsingGccCmd) {
              Write-Host "Using GCC .cmd wrappers in $tcBinDir (r18b). Default flow prefers Clang; pass -UseGcc to force GCC .cmd wrappers." -ForegroundColor Yellow
              # Prefer clang on r18b to avoid android.toolchain.cmake GCC detection failures
              $tcClangBinDir = Join-Path $NDK ("toolchains/llvm/prebuilt/$ndkHost/bin")
              $tcClang = Join-Path $tcClangBinDir "clang++.exe"
              if (Test-Path $tcClang) {
                $UsingLegacyClang = $true
                if ($env:Path -notlike "*${tcClangBinDir}*") { $env:Path = "$tcClangBinDir;" + $env:Path }
                Write-Host "Using clang bin: $tcClangBinDir" -ForegroundColor DarkCyan
                # Use NDK's own CMake toolchain when using LLVM on r18b
                $ToolchainFile = Join-Path $NDK 'build/cmake/android.toolchain.cmake'
                Write-Host "Switching toolchain file to NDK's: $ToolchainFile" -ForegroundColor DarkCyan
              } else {
                Write-Warning "Clang not found at $tcClang. GCC .cmd wrappers may still fail with android.toolchain.cmake. Consider installing NDK r16b or pass -UseGcc to try anyway."
              }
            }
          } else {
            # Try legacy clang in r18b
            $tcClangBinDir = Join-Path $NDK ("toolchains/llvm/prebuilt/$ndkHost/bin")
            $tcClang = Join-Path $tcClangBinDir "clang++.exe"
            Write-Host "Checking legacy LLVM clang:" -ForegroundColor DarkCyan
            Write-Host "  $tcClang -> $([bool](Test-Path $tcClang))"
            if (Test-Path $tcClang) {
              Write-Host "GCC toolchain not found; falling back to legacy Clang in NDK r18b" -ForegroundColor Yellow
              $UsingLegacyClang = $true
              # Prepend LLVM bin to PATH so cmake can locate clang/ar/ld
              if ($env:Path -notlike "*${tcClangBinDir}*") { $env:Path = "$tcClangBinDir;" + $env:Path }
              Write-Host "Using clang bin: $tcClangBinDir" -ForegroundColor DarkCyan
              # Use NDK's own CMake toolchain when using LLVM on r18b
              $ToolchainFile = Join-Path $NDK 'build/cmake/android.toolchain.cmake'
              Write-Host "Switching toolchain file to NDK's: $ToolchainFile" -ForegroundColor DarkCyan
              # If API 15 requested on NDK r18+ (LLVM toolchain), abort early with guidance
              if ([int]$ApiLevel -lt 16 -and ($NdkVer -match 'r(1[89]|2\d)')) {
                throw "API 15 requires NDK r16b (GCC + gnustl). Your selected NDK '$NdkVer' enforces min android-16 and removed gnustl. Install android-ndk-r16b and point the script to it, or raise API to 16+."
              }
            } else {
              throw "Legacy GCC toolchain not found at either '$tcGcc' or '$tcAlt', and no legacy Clang found at '$tcClang'. Your NDK at '$NDK' seems incomplete (empty 'toolchains'). Install a full NDK r16b/r18b and point the script to it."
            }
          }
        }
      }
      # Extra validation for legacy GCC flow: prefer android-15 platforms headers; if missing but sysroot exists,
      # fall back to NDK toolchain (clang) with ANDROID_PLATFORM=android-15 and c++_static.
      if ($Mode -eq 'legacy' -and -not $UsingLegacyClang) {
        $api15Header = Join-Path $NDK 'platforms/android-15/arch-arm/usr/include/android/api-level.h'
        if (-not (Test-Path $api15Header)) {
          $sysrootInc = Join-Path $NDK 'sysroot/usr/include/android'
          if (Test-Path $sysrootInc) {
            if ($UseGcc -and $gccExeC -and $gccExeCxx) {
              Write-Warning "android-15 platforms headers missing; proceeding with GCC using sysroot at $sysrootInc due to -UseGcc."
            } else {
              Write-Warning "NDK platforms/android-15 headers not found, but sysroot exists at $sysrootInc. Switching to NDK toolchain (clang) targeting ANDROID_PLATFORM=android-15."
              # Enable legacy clang path using NDK toolchain
              $ndkHost = if ($env:ANDROID_NDK_HOST) { $env:ANDROID_NDK_HOST } else { 'windows-x86_64' }
              $tcClangBinDir = Join-Path $NDK ("toolchains/llvm/prebuilt/$ndkHost/bin")
              if (-not (Test-Path (Join-Path $tcClangBinDir 'clang++.exe'))) {
                throw "Cannot switch to NDK toolchain: clang not found under $tcClangBinDir"
              }
              if ($env:Path -notlike "*${tcClangBinDir}*") { $env:Path = "$tcClangBinDir;" + $env:Path }
              $UsingLegacyClang = $true
              $ToolchainFile = Join-Path $NDK 'build/cmake/android.toolchain.cmake'
              Write-Host "Using clang bin: $tcClangBinDir" -ForegroundColor DarkCyan
              Write-Host "Switching toolchain file to NDK's: $ToolchainFile" -ForegroundColor DarkCyan
            }
          } else {
            throw "NDK r16b seems incomplete: missing '$api15Header' and no sysroot at '$sysrootInc'. Provide a full r16b or transplant platforms/android-15."
          }
        }
      }

      # Force NEON for armeabi-v7a by using the toolchain's NEON ABI variant
      $abiForCMake = $abi
      if ($abi -eq 'armeabi-v7a') {
        $abiForCMake = 'armeabi-v7a with NEON'
        Write-Host "Using NEON ABI variant for CMake: '$abiForCMake'" -ForegroundColor DarkCyan
      }

      # Resolve FMOD dir for this ABI; if not provided and default doesn't exist, prompt the user
      $abiNormalized = if ($abi -like 'armeabi-v7a*') { 'armeabi-v7a' } else { $abi }
      $defaultFmodDir = (Join-Path $RepoRoot (Join-Path 'fmod/Android' $abiNormalized))
      $ChosenFmodDir = $null
      if ($FMODLibDir -and (Test-Path $FMODLibDir)) {
        $ChosenFmodDir = (Abs $FMODLibDir)
      } elseif (Test-Path $defaultFmodDir) {
        $ChosenFmodDir = (Abs $defaultFmodDir)
      } else {
        $defaultFmodRel = Rel $ScriptRoot $defaultFmodDir
        $ans = Ask ("Enter FMOD library directory for ABI '$abiNormalized'") $defaultFmodRel
        if (-not [string]::IsNullOrWhiteSpace($ans)) {
          # Interpret relative against cmake/ folder to honor ../ style
          $ansAbs = Abs (Join-Path $ScriptRoot $ans)
          if (Test-Path $ansAbs) { $ChosenFmodDir = $ansAbs } else { Write-Host "Warning: FMOD directory not found: $ans" -ForegroundColor Yellow }
        }
      }

      $args = @(
        "-DCMAKE_TOOLCHAIN_FILE=$ToolchainFile",
        "-DANDROID_ABI=$abiForCMake",
        "-DANDROID_NDK=$NDK",
        "-DANDROID_NDK_ROOT=$NDK",
        "-DCONTRIB_PATH=$ContribPath",
        "-DLIBRARY_OUTPUT_PATH_ROOT=$outDir",
        "-DCMAKE_BUILD_TYPE=$bt",
        "-G", $Gen,
        $SourceDir
      )
      if ($ChosenFmodDir) {
        $fmodRel = Rel $ScriptRoot $ChosenFmodDir
        Write-Host "FMOD dir:    $fmodRel" -ForegroundColor DarkGray
        $args = @("-DFMOD_LIB_DIR=$ChosenFmodDir") + $args
      }
      # On official NDK toolchain (r17c), enable NEON for armeabi-v7a via ANDROID_ARM_NEON
      if ($abi -eq 'armeabi-v7a') {
        $args = @("-DANDROID_ARM_NEON=ON") + $args
        # Also add legacy variable name for older community toolchains (no harm if unused)
        $args = @("-DANDROID_NEON=ON") + $args
      }
      if ($Mode -eq 'legacy') {
        if ($UsingLegacyClang) {
          $args += @(
            "-DANDROID_TOOLCHAIN=clang",
            # Use NDK's variable when using its toolchain file
            "-DANDROID_PLATFORM=android-$ApiLevel",
            # Prefer libc++ when using NDK toolchain/sysroot
            "-DANDROID_STL=c++_static",
            "-DRBX_STL_INCLUDE_DIRS=$RBX_STL_INCLUDE_DIRS",
            # Help old toolchain: set explicit compilers to the NDK clang
            "-DCMAKE_C_COMPILER=$((Join-Path $tcClangBinDir 'clang.exe'))",
            "-DCMAKE_CXX_COMPILER=$((Join-Path $tcClangBinDir 'clang++.exe'))",
            # Also set ASM compiler to avoid CMAKE_ASM_COMPILER errors
            "-DCMAKE_ASM_COMPILER=$((Join-Path $tcClangBinDir 'clang.exe'))"
          )
        } else {
          $args += @(
            "-DANDROID_TOOLCHAIN=gcc",
            "-DANDROID_TOOLCHAIN_NAME=$ToolchainName",
            "-DANDROID_NATIVE_API_LEVEL=$ApiLevel",
            "-DANDROID_STL=$Stl",
            "-DRBX_STL_INCLUDE_DIRS=$RBX_STL_INCLUDE_DIRS"
          )
          # If user explicitly wants GCC, set compilers even for .cmd wrappers
          if ($UseGcc -and $gccExeC -and $gccExeCxx) {
            $args += @(
              "-DCMAKE_C_COMPILER=$gccExeC",
              "-DCMAKE_CXX_COMPILER=$gccExeCxx",
              "-DCMAKE_ASM_COMPILER=$gccExeC"
            )
          }
        }
      } else {
        # Modern flags
        $args += @(
          "-DANDROID_PLATFORM=$ApiLevel",
          "-DANDROID_STL=$Stl",
          "-DRBX_STL_INCLUDE_DIRS=$RBX_STL_INCLUDE_DIRS"
        )
      }

      # Ensure CMAKE_MAKE_PROGRAM is explicitly provided when available
      if ($NinjaPath) { $args = @("-DCMAKE_MAKE_PROGRAM=$NinjaPath") + $args }
      if ($MingwMakePath) { $args = @("-DCMAKE_MAKE_PROGRAM=$MingwMakePath") + $args }
      Write-Host "CMake args preview:" -ForegroundColor DarkGray
      foreach ($a in $args) { if ($a -match 'CMAKE_TOOLCHAIN_FILE|ANDROID_') { Write-Host ("  {0}" -f $a) -ForegroundColor DarkGray } }
      & cmake @args
      if ($LASTEXITCODE) { throw "cmake configure failed" }

      Write-Host "Building: $bt / $abi" -ForegroundColor Green
      & cmake --build . -- -j $jobs
      if ($LASTEXITCODE) { throw "cmake build failed" }

      # Auto-copy lib to app jniLibs
      $so = Join-Path $outDir (Join-Path "libs/$abi" "libroblox.so")
      $dstDir = Join-Path $AndroidApp ("jniLibs/" + $abi)
      if (Test-Path $so) {
        if (-not (Test-Path $dstDir)) { New-Item -ItemType Directory -Force -Path $dstDir | Out-Null }
        Copy-Item $so (Join-Path $dstDir "libroblox.so") -Force
        Write-Host "Copied: $so -> $dstDir" -ForegroundColor Yellow
      } else {
        Write-Warning "libroblox.so not found at $so"
      }
    }
    finally { Pop-Location }
  }
}

Write-Host "\nDone. You can now build APKs with gradle, e.g.:"
Write-Host "  cd $($AndroidApp | ForEach-Object {$_})\.."
Write-Host "  .\\gradlew :NativeShell:assembleApi19Debug"
