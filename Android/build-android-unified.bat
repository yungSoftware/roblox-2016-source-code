@echo off

:: Unified Android build script wrapper
:: Usage: build-android-unified [action]
::   action: libroblox | obb | apk | deps

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0build-android-unified.ps1" %*
