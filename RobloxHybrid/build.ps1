# RobloxHybrid Build Script (PowerShell)

# Source files to compile
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

try {
  # Check Java availability
  if (-not (Get-Command java -ErrorAction SilentlyContinue)) {
    throw "Java (java.exe) not found on PATH. Install JRE/JDK and ensure 'java' is available."
  }

  Write-Host "Compiling RobloxHybrid with Google Closure Compiler..." -ForegroundColor Cyan
  & java -jar .\closure-compiler\compiler.jar `
    --compilation_level WHITESPACE_ONLY `
    --js_output_file RobloxHybrid.js `
    --output_wrapper "(function() { %output% })();" `
    --js $srcFiles[0] `
    --js $srcFiles[1] `
    --js $srcFiles[2] `
    --js $srcFiles[3] `
    --js $srcFiles[4] `
    --js $srcFiles[5] `
    --js $srcFiles[6] `
    --js $srcFiles[7] `
    --js $srcFiles[8] `
    --js $srcFiles[9] `
    --js $srcFiles[10]

  if ($LASTEXITCODE -ne 0) {
    throw "Closure Compiler failed with exit code $LASTEXITCODE"
  }

  if (-not (Test-Path .\RobloxHybrid.js)) {
    throw "Compiler completed but output file 'RobloxHybrid.js' was not created."
  }

  # Copy to Android assets
  $destDir = "..\Android\NativeShell\assets\html"
  if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Path $destDir -Force | Out-Null }
  Copy-Item -Path .\RobloxHybrid.js -Destination $destDir -Force
  Write-Host "Built and copied RobloxHybrid.js -> $destDir" -ForegroundColor Green
}
catch {
  Write-Error $_
  exit 1
}

