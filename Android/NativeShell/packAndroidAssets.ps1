param(
    [string]$PackageName = 'com.roblox.client',
    [string]$ObbVersion = '1',
    [string]$Configuration = 'release', # for info only
    [switch]$CopyFMOD # if set, copy FMOD jar/so into NativeShell tree when found
)

$ErrorActionPreference = 'Stop'

Function Write-Info($msg){ Write-Host "[INFO] $msg" -ForegroundColor Cyan }
Function Write-Warn($msg){ Write-Host "[WARN] $msg" -ForegroundColor Yellow }
Function Write-Err($msg){ Write-Host "[ERROR] $msg" -ForegroundColor Red }

# Resolve important paths
$ScriptDir = Split-Path -LiteralPath $MyInvocation.MyCommand.Path -Parent
$RepoRoot = Resolve-Path (Join-Path $ScriptDir '..' '..') | % { $_.Path }
$OutputDir = Join-Path $ScriptDir 'obb'
$AssetsDir = Join-Path $ScriptDir 'assets'
$JniLibsArmeabi = Join-Path $ScriptDir 'jniLibs/armeabi-v7a'

# Inputs to include in OBB (sourceRootRelative:destinationInObb)
$IncludeDirs = @(
    @{ from = 'content';              to = 'content'  },
    @{ from = 'shaders';              to = 'shaders'  },
    @{ from = 'PlatformContent/android'; to = 'android' }
)

# Construct output file name
$ObbName = "main.$ObbVersion.$PackageName.obb"
$ObbPath = Join-Path $OutputDir $ObbName
$FingerprintPath = Join-Path $OutputDir 'fingerprint.txt'

# Ensure output folders
New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
New-Item -ItemType Directory -Force -Path $AssetsDir | Out-Null

# Build temp staging folder to control archive layout
$StagingDir = Join-Path $OutputDir 'staging'
if (Test-Path $StagingDir) { Remove-Item -Recurse -Force $StagingDir }
New-Item -ItemType Directory -Force -Path $StagingDir | Out-Null

# Validate and copy inputs
$missing = @()
foreach ($m in $IncludeDirs){
    $src = Join-Path $RepoRoot $m.from
    $dst = Join-Path $StagingDir $m.to
    if (!(Test-Path $src)){
        $missing += $m.from
        Write-Warn "Missing source folder: $src"
        continue
    }
    Write-Info "Packing $($m.from) -> $($m.to)"
    New-Item -ItemType Directory -Force -Path (Split-Path $dst -Parent) | Out-Null
    # Ensure destination is clean to fully mirror source contents
    if (Test-Path $dst) { Remove-Item -Recurse -Force $dst }
    Copy-Item -Recurse -Force "$src" "$dst"

    # If packing shaders, remove shaders.json and source/ per requirement
    if ($m.to -eq 'shaders') {
        $shaderJson = Join-Path $dst 'shaders.json'
        if (Test-Path $shaderJson) {
            Remove-Item -Force $shaderJson
            Write-Info "Excluded shaders.json from shaders"
        }
        $shaderSource = Join-Path $dst 'source'
        if (Test-Path $shaderSource) {
            Remove-Item -Recurse -Force $shaderSource
            Write-Info "Excluded shaders/source from shaders"
        }

        # Exclude D3D shader artifacts (not used on Android)
        $patterns = @('*d3d9*', '*d3d11*')
        foreach($pat in $patterns){
            $items = Get-ChildItem -LiteralPath $dst -Recurse -Force -ErrorAction SilentlyContinue -Filter $pat
            foreach($it in $items){
                try { if ($it.PSIsContainer) { Remove-Item -Recurse -Force $it.FullName } else { Remove-Item -Force $it.FullName } } catch {}
            }
        }
        Write-Info "Excluded D3D9/D3D11 shader files from shaders"
    }
}

if ($missing.Count -gt 0){
    Write-Warn "Some source folders were missing: $($missing -join ', ')"
}

# Create OBB (zip). Prefer Compress-Archive
if (Test-Path $ObbPath) { Remove-Item -Force $ObbPath }
Write-Info "Creating OBB: $ObbPath"
Compress-Archive -Path (Join-Path $StagingDir '*') -DestinationPath $ObbPath -CompressionLevel Optimal

# Compute MD5 fingerprint
$md5 = (Get-FileHash -Algorithm MD5 -LiteralPath $ObbPath).Hash.ToLower()
$md5 | Out-File -Encoding ascii -NoNewline $FingerprintPath
Write-Info "OBB MD5: $md5"

# Copy OBB + fingerprint into assets for embedding into APK
Copy-Item -Force $ObbPath (Join-Path $AssetsDir (Split-Path $ObbPath -Leaf))
Copy-Item -Force $FingerprintPath (Join-Path $AssetsDir 'fingerprint.txt')
Write-Info "Copied OBB and fingerprint into $AssetsDir"

# Sanity checks for native + 3rd-party libs
# 1) libroblox.so presence for armeabi-v7a
if (!(Test-Path $JniLibsArmeabi)) { New-Item -ItemType Directory -Force -Path $JniLibsArmeabi | Out-Null }
$LibRoblox = Join-Path $JniLibsArmeabi 'libroblox.so'
if (Test-Path $LibRoblox) { Write-Info "Found: $LibRoblox" } else { Write-Warn "Missing libroblox.so in $JniLibsArmeabi (copy your built .so here)." }

# 2) FMOD checks (jar + native so)
$fmodRootJar = Join-Path $RepoRoot 'fmod/Android/fmod.jar'
$fmodJarDst  = Join-Path $ScriptDir 'libs/fmod.jar'
if (Test-Path $fmodRootJar){
    Write-Info "Found FMOD jar: $fmodRootJar"
    if ($CopyFMOD) {
        New-Item -ItemType Directory -Force -Path (Split-Path $fmodJarDst -Parent) | Out-Null
        Copy-Item -Force $fmodRootJar $fmodJarDst
        Write-Info "Copied FMOD jar to $fmodJarDst"
    } else {
        if (!(Test-Path $fmodJarDst)) { Write-Warn "FMOD jar not in NativeShell/libs. Run with -CopyFMOD to copy." }
    }
} else {
    Write-Warn "FMOD jar not found at $fmodRootJar"
}

# FMOD native libs (armeabi-v7a)
$fmodSoSrcDir = Join-Path $RepoRoot 'fmod/Android/armeabi-v7a'
if (Test-Path $fmodSoSrcDir){
    $fmodSos = Get-ChildItem $fmodSoSrcDir -Filter 'libfmod*.so' -ErrorAction SilentlyContinue
    if ($fmodSos.Count -gt 0){
        foreach($so in $fmodSos){
            $dst = Join-Path $JniLibsArmeabi $so.Name
            if ($CopyFMOD){ Copy-Item -Force $so.FullName $dst; Write-Info "Copied $($so.Name) to $JniLibsArmeabi" }
        }
    } else { Write-Warn "No FMOD .so files found in $fmodSoSrcDir" }
} else {
    Write-Warn "FMOD native dir not found: $fmodSoSrcDir"
}

Write-Host "`nDone. Outputs:" -ForegroundColor Green
Write-Host "  OBB:         $ObbPath"
Write-Host "  Fingerprint: $FingerprintPath"
Write-Host "  Assets:      $AssetsDir"
