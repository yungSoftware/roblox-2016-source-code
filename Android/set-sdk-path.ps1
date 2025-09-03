# Set the Android SDK path in local.properties
$sdkPath = "G:/SDK"  # Update this path if needed

# Create or update local.properties
$localPropsPath = Join-Path $PSScriptRoot "local.properties"
"sdk.dir=$sdkPath" | Out-File -FilePath $localPropsPath -Encoding ASCII -Force

Write-Host "Set Android SDK path to: $sdkPath" -ForegroundColor Green
Write-Host "Updated: $localPropsPath" -ForegroundColor Green

# Verify the path exists
if (Test-Path $sdkPath) {
    Write-Host "SDK path exists: $(Test-Path $sdkPath)" -ForegroundColor Green
    
    # Check for platform-tools
    $platformTools = Join-Path $sdkPath "platform-tools/adb.exe"
    if (Test-Path $platformTools) {
        Write-Host "Platform tools found at: $platformTools" -ForegroundColor Green
    } else {
        Write-Host "Warning: Platform tools not found at expected location" -ForegroundColor Yellow
    }
} else {
    Write-Host "Warning: SDK path does not exist: $sdkPath" -ForegroundColor Red
}

Write-Host "`nNow try building the APK again." -ForegroundColor Cyan
