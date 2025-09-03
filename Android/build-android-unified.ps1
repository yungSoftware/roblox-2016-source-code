param(
  [string]$Action = ""
)

function Show-Menu {
  Write-Host "==== Android Build Menu ====" -ForegroundColor Cyan
  Write-Host "1. Build libroblox.so"
  Write-Host "2. Package OBB"
  Write-Host "3. Build APK"
  Write-Host "4. Clean Build"
  Write-Host "5. Build RobloxHybrid"
  Write-Host "6. Auto-detect SDK/NDK"
  Write-Host "7. Clean Gradle Cache"
  Write-Host "Q. Quit"
}

function Get-BuildMode {
  do {
    Write-Host "`nSelect Build Mode:" -ForegroundColor Cyan
    Write-Host "1. Modern (API 21+, all ABIs)"
    Write-Host "2. Legacy (API 15, NDK 17, x86/arm only)"
    $mode = Read-Host "Enter choice (1)"
    
    switch ($mode) {
      '1' { 
        return @{
          Mode = 'modern'
          ApiLevel = 21
          AbiOptions = @('armeabi-v7a', 'arm64-v8a', 'x86', 'x86_64')
          DefaultNdks = @()
        }
      }
      '2' {
        return @{
          Mode = 'legacy'
          ApiLevel = 15
          AbiOptions = @('armeabi-v7a', 'x86')
          DefaultNdks = @("$PSScriptRoot/../cmake/Toolchains/android-ndk-r17c")
        }
      }
      default { Write-Host "Invalid selection" -ForegroundColor Red }
    }
  } while ($true)
}

function Get-NdkPath {
  param($DefaultNdks)
  
  $ndkPath = $env:ANDROID_NDK
  if ($ndkPath -and (Test-Path $ndkPath)) {
    return $ndkPath
  }
  
  foreach ($path in $DefaultNdks) {
    if (Test-Path $path) {
      return $path
    }
  }
  
  Write-Host "NDK not found in default locations" -ForegroundColor Yellow
  do {
    $ndkPath = Read-Host "Enter full path to Android NDK"
    if ($ndkPath -and (Test-Path $ndkPath)) {
      return $ndkPath
    }
    Write-Host "Invalid path" -ForegroundColor Red
  } while ($true)
}

function Get-BuildOptions {
  param($Mode, $AbiOptions)
  
  $selectedAbis = @()
  do {
    Write-Host "`nAvailable ABIs:" -ForegroundColor Cyan
    for ($i=0; $i -lt $AbiOptions.Count; $i++) {
      Write-Host "$($i+1). $($AbiOptions[$i])"
    }
    $input = Read-Host "Select ABIs (comma separated, e.g. 1,2 or 0 for all)"
    
    if ($input -eq '0') {
      $selectedAbis = $AbiOptions
      break
    }
    
    $selectedIndices = $input.Split(',') | ForEach-Object { [int]$_ - 1 } | Where-Object { $_ -ge 0 -and $_ -lt $AbiOptions.Count }
    $selectedAbis = $selectedIndices | ForEach-Object { $AbiOptions[$_] } | Select-Object -Unique
    
    if ($selectedAbis.Count -eq 0) {
      Write-Host "Invalid selection" -ForegroundColor Red
    }
  } while ($selectedAbis.Count -eq 0)
  
  # Build type selection
  $buildTypeOptions = @('Release', 'Debug', 'Noopt')
  $selectedBuildTypes = @()
  do {
    Write-Host "`nAvailable Build Types:" -ForegroundColor Cyan
    for ($i=0; $i -lt $buildTypeOptions.Count; $i++) {
      Write-Host "$($i+1). $($buildTypeOptions[$i])"
    }
    $input = Read-Host "Select build types (comma separated, e.g. 1,2 or 0 for all)"
    
    if ($input -eq '0') {
      $selectedBuildTypes = $buildTypeOptions
      break
    }
    
    $selectedIndices = $input.Split(',') | ForEach-Object { [int]$_ - 1 } | Where-Object { $_ -ge 0 -and $_ -lt $buildTypeOptions.Count }
    $selectedBuildTypes = $selectedIndices | ForEach-Object { $buildTypeOptions[$_] } | Select-Object -Unique
    
    if ($selectedBuildTypes.Count -eq 0) {
      Write-Host "Invalid selection" -ForegroundColor Red
    }
  } while ($selectedBuildTypes.Count -eq 0)
  
  return @{
    Abis = $selectedAbis
    BuildTypes = $selectedBuildTypes
  }
}

function Build-Libroblox {
  # Get build mode first
  $modeSettings = Get-BuildMode
  
  # Get NDK path based on mode
  $NDKRoot = Get-NdkPath -DefaultNdks $modeSettings.DefaultNdks
  $RepoRoot = (Resolve-Path "$PSScriptRoot/../").Path
  $env:CONTRIB_PATH = Join-Path $RepoRoot "Contribs"

  if (-not $NDKRoot -or -not (Test-Path $NDKRoot)) {
    Write-Host "Failed to find valid NDK path" -ForegroundColor Red
    return
  }
  
  # Calculate STL include paths
  $stlIncludes = @(
    "$NDKRoot/sources/cxx-stl/llvm-libc++/include",
    "$NDKRoot/sources/cxx-stl/llvm-libc++abi/include",
    "$NDKRoot/sources/android/support/include"
  )
  
  # Get build options
  $options = Get-BuildOptions -Mode $modeSettings.Mode -AbiOptions $modeSettings.AbiOptions
  $AbiList = $options.Abis
  $BuildTypes = $options.BuildTypes
  
  # Ask for performance mode (affects Ninja parallelism)
  $SpeedMode = $null
  $procCount = [Math]::Max(2, [Environment]::ProcessorCount)
  do {
    Write-Host "`nSelect build performance mode:" -ForegroundColor Cyan
    Write-Host "1. Fast (parallel: -j $procCount) - higher RAM, less stable on Windows"
    Write-Host "2. Stable (single-threaded: -j 1) - slower, most reliable" 
    $sel = Read-Host "Enter choice (1=Fast, 2=Stable, default 2)"
    switch ($sel) {
      '1' { $SpeedMode = 'fast' }
      '2' { $SpeedMode = 'stable' }
      ''  { $SpeedMode = 'stable' }
      default { Write-Host "Invalid selection" -ForegroundColor Red }
    }
  } while (-not $SpeedMode)
  
  # Set Breakpad path
  foreach ($abi in $AbiList) {
    $abiNormalized = if ($abi -like 'armeabi*') { 'arm' } else { 'x86' }
    $env:BREAKPAD_PATH = Join-Path $RepoRoot "Contribs/android/$abiNormalized/google-breakpad/20MAY2014"
    break  # Just need to set it once per build
  }

  # Set OpenSSL path
  $env:OPENSSL_ROOT_DIR = Join-Path $RepoRoot "openssl"
  $env:OPENSSL_LIB_DIR = Join-Path $env:OPENSSL_ROOT_DIR "lib"

  # Handle cURL paths
  foreach ($abi in $AbiList) {
    # Prefer legacy folder name first to match old guidance, but fall back to canonical install path used by builder
    $curlCandidates = @()
    if ($abi -eq 'armeabi-v7a') {
      $curlCandidates += (Join-Path $RepoRoot "Contribs/android/armeabi-v7a with NEON/curl/curl-7.43.0")
      $curlCandidates += (Join-Path $RepoRoot "Contribs/android/arm/curl/curl-7.43.0")
      $curlCandidates += (Join-Path $RepoRoot "Contribs/android/armeabi-v7a/curl/curl-7.43.0")
    }
    else {
      $curlCandidates += (Join-Path $RepoRoot "Contribs/android/$abi/curl/curl-7.43.0")
    }

    $foundCurl = $curlCandidates | Where-Object { Test-Path $_ } | Select-Object -First 1

    if (-not $foundCurl) {
      Write-Host "Building cURL for $abi..." -ForegroundColor Yellow
      $archForBuilder = if ($abi -eq 'armeabi-v7a') { 'armeabi-v7a' } else { $abi }
      & "$PSScriptRoot/../tools/build-curl-android.cmd" "$archForBuilder" 16 Release

      # After build, set expected install path based on builder's layout
      if ($abi -eq 'armeabi-v7a') {
        $foundCurl = Join-Path $RepoRoot "Contribs/android/arm/curl/curl-7.43.0"
      }
      else {
        $foundCurl = Join-Path $RepoRoot "Contribs/android/$abi/curl/curl-7.43.0"
      }
    }

    $env:CURL_PATH = $foundCurl
    break
  }

  Write-Host "Using $($modeSettings.Mode) mode with NDK at: $NDKRoot" -ForegroundColor Cyan
  
  # Run CMake configuration and build
  $BuildRoot = Join-Path $RepoRoot "Android/build"
  if (-not (Test-Path $BuildRoot)) { New-Item -ItemType Directory -Path $BuildRoot | Out-Null }
  
  foreach ($abi in $AbiList) {
    foreach ($bt in $BuildTypes) {
      $outDir = Join-Path (Join-Path $BuildRoot $bt.ToLower()) $abi
      if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir | Out-Null }
      
      Push-Location $outDir
      try {
        # Clean configure only when explicitly requested to avoid full rebuilds every run
        if ($env:RBX_FORCE_RECONFIGURE -eq '1') {
          if (Test-Path "$outDir/CMakeCache.txt") { Remove-Item -Force "$outDir/CMakeCache.txt" }
          if (Test-Path "$outDir/CMakeFiles") { Remove-Item -Recurse -Force "$outDir/CMakeFiles" }
        }

        Write-Host "Configuring: $bt / $abi" -ForegroundColor Cyan
        
        # Ensure NEON on ARMv7: force NEON ABI and flags for consistent __ARM_NEON
        $abiForCMake = $abi
        $extraNeonArgs = @()
        if ($abi -eq 'armeabi-v7a') {
          $abiForCMake = 'armeabi-v7a with NEON'
          $extraNeonArgs = @(
            '-DANDROID_ARM_NEON=ON',
            '-DANDROID_NEON=ON',
            # Fallback: append NEON flags to ensure compiler defines __ARM_NEON for C/C++
            '"-DCMAKE_C_FLAGS=${CMAKE_C_FLAGS} -mfpu=neon"',
            '"-DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS} -mfpu=neon -D__ARM_NEON=1"'
          )
        }

        # Normalize contrib path and pass explicitly so Curl.cmake can resolve headers
        $contribPath = (Join-Path $RepoRoot 'Contribs')
        $contribPath = $contribPath -replace '\\','/'

        $args = @(
          "-DCMAKE_TOOLCHAIN_FILE=$NDKRoot/build/cmake/android.toolchain.cmake",
          "-DANDROID_ABI=$abiForCMake",
          "-DANDROID_NDK=$NDKRoot",
          "-DANDROID_PLATFORM=android-$($modeSettings.ApiLevel)",
          "-DANDROID_STL=c++_static",
          "-DRBX_STL_INCLUDE_DIRS=$($stlIncludes -join ';')",
          "-DCMAKE_BUILD_TYPE=$bt",
          "-DCONTRIB_PATH=$contribPath"
        ) + $extraNeonArgs + @(
          "-G", "Ninja",
          $RepoRoot
        )
        
        & cmake @args
        if ($LASTEXITCODE) { throw "cmake configure failed" }
        
        # Set Ninja parallelism based on selected performance mode (honor selection even in legacy)
        $ninjaArgs = @('--','-v')
        if ($SpeedMode -eq 'stable') {
          $ninjaArgs += @('-j','1')
          Write-Host "Using Stable mode: Ninja -j 1" -ForegroundColor Yellow
        } else {
          $ninjaArgs += @('-j', "$procCount")
          if ($modeSettings.Mode -eq 'legacy') { Write-Host "Warning: Fast mode on legacy can be less stable on Windows (file locks)." -ForegroundColor DarkYellow }
          Write-Host "Using Fast mode: Ninja -j $procCount" -ForegroundColor Yellow
        }

        Write-Host "Building: $bt / $abi (this may take several minutes)" -ForegroundColor Green
        & cmake --build . --config $bt @ninjaArgs
        $exit = $LASTEXITCODE
        if ($exit -ne 0) {
          Write-Host "Build failed; retrying once in 2s..." -ForegroundColor Yellow
          Start-Sleep -Seconds 2
          & cmake --build . --config $bt @ninjaArgs
          if ($LASTEXITCODE) { throw "cmake build failed" }
        }
        
        # Locate built library (CMake/Ninja usually emits into build root; ndk-build-style emits into libs/<abi>)
        $soCandidates = @(
          (Join-Path $outDir 'libroblox.so'),
          (Join-Path $outDir "libs/$abi/libroblox.so")
        )
        $builtSo = $null
        foreach ($cand in $soCandidates) { if (Test-Path $cand) { $builtSo = $cand; break } }

        if ($builtSo) {
          # Strip symbols for Release builds by default to reduce size
          $strip = Join-Path $NDKRoot 'toolchains/llvm/prebuilt/windows-x86_64/bin/llvm-strip.exe'
          if ($bt -eq 'Release' -and (Test-Path $strip)) {
            & $strip -s $builtSo
          } elseif ($env:RBX_STRIP_SO -eq '1' -and (Test-Path $strip)) {
            & $strip -s $builtSo
          }

          $dstDir = Join-Path $RepoRoot "Android/NativeShell/jniLibs/$abi"
          if (-not (Test-Path $dstDir)) { New-Item -ItemType Directory -Path $dstDir | Out-Null }
          Copy-Item $builtSo $dstDir -Force

          $sizeMB = [Math]::Round(((Get-Item $builtSo).Length / 1MB), 2)
          Write-Host "Build succeeded: $abi / $bt -> $(Split-Path -Leaf $builtSo) (${sizeMB} MB)" -ForegroundColor Green
          Write-Host "Copied: $builtSo -> $dstDir" -ForegroundColor Yellow
        } else {
          Write-Warning "Build finished but libroblox.so was not found in expected locations under $outDir"
        }
      }
      finally { Pop-Location }
    }
  }
}

function Package-OBB {
  Write-Host "Packaging OBB..." -ForegroundColor Green
  & "$PSScriptRoot/packAndroidAssets.ps1"
}

function AutoDetect-AndroidSdk {
  # Check if local.properties exists and read SDK path from it
  $localPropsPath = Join-Path $PSScriptRoot 'local.properties'
  if (Test-Path $localPropsPath) {
    $sdkLine = Get-Content $localPropsPath | Where-Object { $_ -match '^sdk\.dir=(.+)' }
    if ($sdkLine) {
      $sdkPath = $matches[1].Trim()
      $sdkPath = $sdkPath -replace '^"|"$|\\', '/'  # Normalize path separators
      if (Test-Path "$sdkPath/platform-tools/adb.exe") {
        Write-Host "Using SDK from local.properties: $sdkPath" -ForegroundColor Green
        return $sdkPath
      }
    }
  }

  # Common SDK locations
  $sdkLocations = @(
    "G:/SDK",  # Explicit path from your output
    "$env:LOCALAPPDATA/Android/Sdk",
    "$env:ProgramFiles/Android/Android Studio/sdk",
    "$env:ProgramFiles (x86)/Android/android-sdk",
    "$env:USERPROFILE/AppData/Local/Android/Sdk",
    $env:ANDROID_HOME
  ) | Where-Object { $_ -ne $null } | Select-Object -Unique

  Write-Host "Checking SDK locations: $($sdkLocations -join ', ')" -ForegroundColor DarkGray
  
  # Check each path
  foreach ($path in $sdkLocations) {
    $platformTools = Join-Path $path 'platform-tools/adb.exe'
    Write-Host "Checking: $path" -ForegroundColor DarkGray
    if (Test-Path $platformTools) {
      Write-Host "Found valid SDK at: $path" -ForegroundColor Green
      return $path
    }
  }
  
  Write-Host "No valid Android SDK found in standard locations" -ForegroundColor Yellow
  return $null
}

function Build-APK {
  Write-Host "Building APK..." -ForegroundColor Green
  
  # First ensure SDK path is set correctly
  $sdkPath = $env:ANDROID_HOME
  if (-not $sdkPath -or -not (Test-Path $sdkPath)) {
    Write-Host "ANDROID_HOME not set or invalid. Attempting to auto-detect SDK..." -ForegroundColor Yellow
    $sdkPath = AutoDetect-AndroidSdk
    if (-not $sdkPath) {
      Write-Host "Failed to locate Android SDK. Please run 'Auto-detect SDK/NDK' first or set ANDROID_HOME." -ForegroundColor Red
      return
    }
    $env:ANDROID_HOME = $sdkPath
  }
  
  # Let user choose Release or Debug for legacy API15-only variant
  do {
    Write-Host "`nSelect Build Type:" -ForegroundColor Cyan
    Write-Host "1. Release"
    Write-Host "2. Debug"
    $btSelection = Read-Host "Enter choice (1-2)"
    switch ($btSelection) {
      '1' { $buildType = 'Release' }
      '2' { $buildType = 'Debug' }
      default { Write-Host "Invalid selection" -ForegroundColor Red }
    }
  } while (-not $buildType)
  
  # Prepare short Gradle cache and optional short path mapping to avoid Win32 MAX_PATH issues
  $driveRoot = $PSScriptRoot.Substring(0,2) # e.g. F:
  $shortGradleHome = Join-Path $driveRoot 'g'    # e.g. F:\g
  if (-not (Test-Path $shortGradleHome)) { New-Item -ItemType Directory -Path $shortGradleHome | Out-Null }
  $env:GRADLE_USER_HOME = $shortGradleHome

  # Try to map a short drive letter to the Android directory to shorten project path depth
  $mapped = $false
  $mapLetter = 'R:'
  try {
    $existing = (& subst) -match "^$mapLetter\\s+=>"
    if (-not $existing) {
      & subst $mapLetter $PSScriptRoot 2>$null
      $mapped = $true
    }
  } catch {}

  $workDir = if ($mapped) { "$mapLetter/NativeShell" } else { "$PSScriptRoot/NativeShell" }

  # Run Gradle build with correct gradlew.bat path
  Push-Location $workDir
  try {
    Write-Host "Gradle working directory: $workDir" -ForegroundColor DarkCyan
    Write-Host "Gradle cache (GRADLE_USER_HOME): $shortGradleHome" -ForegroundColor DarkCyan
    # Common verbose flags for better diagnostics
    $commonGradleArgs = @("--gradle-user-home", "$shortGradleHome", "--stacktrace", "--info", "--console=plain")
    if ($env:RBX_GRADLE_DEBUG -eq '1') { $commonGradleArgs += '--debug' }
    
    # Ensure SDK path is passed to Gradle
    $sdkPath = $env:ANDROID_HOME
    if (-not $sdkPath) { $sdkPath = AutoDetect-AndroidSdk }
    if ($sdkPath) {
      $env:ANDROID_HOME = $sdkPath
      $commonGradleArgs += "-Pandroid.sdk.path=$sdkPath"
    }
    
    # Clean before build
    & "$PSScriptRoot/gradlew.bat" @commonGradleArgs clean
    # Build with selected type
    & "$PSScriptRoot/gradlew.bat" @commonGradleArgs --project-prop "android.useAndroidX=false" --project-prop "android.enableJetifier=false" "assemble$buildType"
    if ($LASTEXITCODE) { throw "Gradle build failed" }
    
    # Show output paths
    $apkPath = "build/outputs/apk/$($buildType.ToLower())/*.apk"
    Get-ChildItem $apkPath | ForEach-Object {
      Write-Host "Built APK: $_" -ForegroundColor Green
    }
  }
  finally {
    Pop-Location
    if ($mapped) { try { & subst $mapLetter /D 2>$null } catch {} }
  }
}

function Build-Dependencies {
  Write-Host "Building Dependencies..." -ForegroundColor Green
  & "$PSScriptRoot/packAndroidAssets.ps1"
  Build-RobloxHybrid
}

function Build-RobloxHybrid {
  Write-Host "Building RobloxHybrid JS..." -ForegroundColor Cyan
  
  $RepoRoot = (Resolve-Path "$PSScriptRoot/../").Path
  $HybridDir = Join-Path $RepoRoot "RobloxHybrid"
  
  if (-not (Test-Path $HybridDir)) {
    Write-Host "RobloxHybrid directory not found at $HybridDir" -ForegroundColor Red
    return
  }
  
  try {
    Push-Location $HybridDir
    Write-Host "Running RobloxHybrid build in: $HybridDir" -ForegroundColor Yellow

    if (-not (Get-Command java -ErrorAction SilentlyContinue)) {
      throw "Java (java.exe) not found on PATH. Install JRE/JDK and ensure 'java' is available."
    }

    $JarPath = Join-Path $HybridDir "closure-compiler/compiler.jar"
    if (-not (Test-Path $JarPath)) {
      throw "Closure Compiler JAR not found at '$JarPath'"
    }

    Write-Host "Java version:" -ForegroundColor DarkCyan
    try { & java -version 2>&1 } catch { Write-Host "(failed to execute 'java -version')" -ForegroundColor Red }

    # Define source files (same list as build.ps1)
    $srcFiles = @(
      "src/base.js",
      "src/common/utils.js",
      "src/common/events.js",
      "src/common/bridge.js",
      "src/common/bridge.ios.js",
      "src/common/bridge.android.js",
      "src/modules/social.js",
      "src/modules/game.js",
      "src/modules/chat.js",
      "src/modules/input.js",
      "src/main.js"
    )

    # Compose Closure Compiler arguments
    $args = @(
      "--compilation_level", "WHITESPACE_ONLY",
      "--js_output_file", "RobloxHybrid.js",
      "--output_wrapper", "(function() { %output% })();"
    )
    foreach ($f in $srcFiles) { $args += @("--js", $f) }

    $ccOutput = & java -jar $JarPath @args 2>&1
    $exit = $LASTEXITCODE
    if ($ccOutput) { $ccOutput | ForEach-Object { Write-Host $_ } }
    if ($exit -ne 0) {
      Write-Host "Closure Compiler failed with exit code $exit" -ForegroundColor Red
      Write-Host "Hints:" -ForegroundColor Yellow
      Write-Host " - Ensure Java 21 (JDK 21) is installed and on PATH (java -version)." -ForegroundColor Yellow
      Write-Host " - Exit code -1 often means Java couldn't start or was blocked by policy/AV." -ForegroundColor Yellow
      Write-Host " - Ensure you can run: java -jar `"$JarPath`" --version" -ForegroundColor Yellow
      Write-Host " - Try running PowerShell as Administrator or whitelisting Java in AV." -ForegroundColor Yellow
      throw "Closure Compiler failed with exit code $exit"
    }

    $JsOutput = Join-Path $HybridDir "RobloxHybrid.js"
    if (-not (Test-Path $JsOutput)) { throw "Compiler finished, but '$JsOutput' was not created." }

    $DestDir = Join-Path $RepoRoot "Android/NativeShell/assets/html"
    if (-not (Test-Path $DestDir)) { New-Item -ItemType Directory -Path $DestDir -Force | Out-Null }
    Copy-Item -Force $JsOutput $DestDir
    Write-Host "Successfully built and copied RobloxHybrid.js" -ForegroundColor Green
  }
  catch {
    Write-Host "Error building RobloxHybrid: $_" -ForegroundColor Red
  }
  finally {
    Pop-Location
  }
}

function Clean-Build {
  Write-Host "Cleaning build artifacts..." -ForegroundColor Yellow
  
  $foldersToClean = @(
    "$PSScriptRoot/build",
    "$PSScriptRoot/NativeShell/jniLibs",
    "$PSScriptRoot/NativeShell/obb",
    "$PSScriptRoot/circleimageview/build"
  )
  
  foreach ($folder in $foldersToClean) {
    if (Test-Path $folder) {
      Remove-Item -Recurse -Force $folder
      Write-Host "Cleaned: $folder" -ForegroundColor Green
    }
  }
}

function Clean-GradleCache {
  Write-Host "Cleaning Gradle cache..." -ForegroundColor Yellow
  # Prefer cleaning the short cache we use to avoid long paths
  $driveRoot = $PSScriptRoot.Substring(0,2)
  $shortGradleHome = Join-Path $driveRoot 'g'
  Push-Location "$PSScriptRoot/NativeShell"
  try {
    & "$PSScriptRoot/gradlew.bat" --gradle-user-home "$shortGradleHome" clean
    & "$PSScriptRoot/gradlew.bat" --gradle-user-home "$shortGradleHome" --stop
    if (Test-Path "$shortGradleHome/caches") { Remove-Item -Recurse -Force "$shortGradleHome/caches" -ErrorAction SilentlyContinue }
    # Also attempt user home cache as fallback
    Remove-Item -Recurse -Force "$env:USERPROFILE/.gradle/caches" -ErrorAction SilentlyContinue
    Write-Host "Gradle cache cleaned" -ForegroundColor Green
  } finally {
    Pop-Location
  }
}

function AutoDetect-Paths {
  Add-Type -AssemblyName System.Windows.Forms
  
  Write-Host "=== Auto-detecting Android Paths ===" -ForegroundColor Cyan
  
  # Common SDK locations checked
  $sdkLocations = @(
    "$env:LOCALAPPDATA/Android/Sdk",
    "$env:ProgramFiles/Android/Android Studio/sdk",
    "$env:USERPROFILE/AppData/Local/Android/Sdk"
  )
  
  Write-Host "Checked SDK locations:" -ForegroundColor Yellow
  $sdkLocations | ForEach-Object { Write-Host "- $_" }
  
  $sdkPath = $sdkLocations | Where-Object { Test-Path "$_/platform-tools/adb.exe" } | Select-Object -First 1
  
  if (-not $sdkPath) {
    Write-Host "SDK not found in standard locations" -ForegroundColor Red
    do {
        $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
        $dialog.Description = "Select Android SDK directory (must contain platform-tools)"
        if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
            $sdkPath = $dialog.SelectedPath
            if (Test-Path "$sdkPath/platform-tools/adb.exe") {
                break
            }
            Write-Host "Invalid SDK path - must contain platform-tools/adb.exe" -ForegroundColor Red
            Write-Host "Example valid path: C:/Users/[username]/AppData/Local/Android/Sdk" -ForegroundColor Yellow
        } else {
            return
        }
    } while ($true)
  }
  
  # Find NDK
  Write-Host "Looking for NDK in: $sdkPath/ndk" -ForegroundColor Yellow
  $ndkPath = Get-ChildItem "$sdkPath/ndk/*" -Directory | 
    Sort-Object Name -Descending | 
    Select-Object -First 1 -ExpandProperty FullName
  
  if (-not $ndkPath) {
    Write-Host "NDK not found in SDK folder" -ForegroundColor Red
    do {
        $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
        $dialog.Description = "Select Android NDK directory (must contain ndk-build.cmd)"
        if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
            $ndkPath = $dialog.SelectedPath
            if (Test-Path "$ndkPath/ndk-build.cmd") {
                break
            }
            Write-Host "Invalid NDK path - must contain ndk-build.cmd" -ForegroundColor Red
            Write-Host "Example valid path: C:/Users/[username]/AppData/Local/Android/Sdk/ndk/[version]" -ForegroundColor Yellow
        } else {
            return
        }
    } while ($true)
  }
  
  # Generate properties file with forward slashes
  $propertiesContent = "sdk.dir=$($sdkPath.Replace('\\', '/'))`nndk.dir=$($ndkPath.Replace('\\', '/'))"
  Set-Content -Path "$PSScriptRoot/local.properties" -Value $propertiesContent
  
  Write-Host "Generated local.properties with:" -ForegroundColor Green
  Write-Host "- SDK: $sdkPath"
  Write-Host "- NDK: $ndkPath"
}

# Main execution
if ($Action -eq "") {
  do {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection) {
      '1' { Build-Libroblox }
      '2' { Package-OBB }
      '3' { Build-APK }
      '4' { Clean-Build }
      '5' { Build-RobloxHybrid }
      '6' { AutoDetect-Paths }
      '7' { Clean-GradleCache }
    }
  } while ($selection -ne 'Q')
} else {
  switch ($Action.ToLower()) {
    'libroblox' { Build-Libroblox }
    'obb' { Package-OBB }
    'apk' { Build-APK }
    'clean' { Clean-Build }
    'hybrid' { Build-RobloxHybrid }
    'setup' { AutoDetect-Paths }
    'gradle' { Clean-GradleCache }
    default { Write-Host "Invalid action specified" -ForegroundColor Red }
  }
}