REM Written by yungDoom
REM LOGIC: It copies the necessary files from various place to folder you've selected.

@ECHO OFF
CLS
ECHO 1. RobloxStudio
ECHO 2. RCCService
ECHO 3. WindowsClient
Echo 4. Custom Location
Echo 5. Exit
ECHO.

CHOICE /C 12345 /M "Enter your choice:"

:: This is where it gets your input
IF ERRORLEVEL 5 GOTO Exit
IF ERRORLEVEL 4 GOTO CustomPath
IF ERRORLEVEL 3 GOTO WindowsClient
IF ERRORLEVEL 2 GOTO RCCService
IF ERRORLEVEL 1 GOTO RobloxStudio

:Exit :: the command line closes.
exit
GOTO End

:CustomPath
ECHO WARNING: Your input should start with: C:\Trunk2016
set /p in=Enter the path where you want the files to go: 
if exist "%in%" (
    if not exist "%in%\libboost_locale-vc110-mt-1_56.lib" (
    xcopy C:\Trunk2016\Contribs\boost_1_56_0\stage\lib\*.* %in%
    )
    if not exist "%in%\VMProtectSDK32.lib" (
    xcopy C:\Trunk2016\Contribs\VMProtectWin_2.13\lib\*.lib %in%
    )
    if not exist "%in%\libcurl_a.lib" (
    xcopy "C:\Trunk2016\Contribs\windows\x86\curl\curl-7.43.0\build\Win32\VC11\DLL Release - DLL OpenSSL\libcurl_a.lib" %in%
    )
    if not exist "%in%\VMProtectSDK32.lib" (
    xcopy C:\Trunk2016\zlib\win\bin\Release\*.lib %in%
    )
    color 02
    ECHO All the folders has been copied, have a good luck!
    TIMEOUT /T 3 
) else ( 
  color 04
  ECHO Failed to copy the files, check if your folders are intact.
  ECHO Make sure you've extracted the Source and Contribs correctly.
  TIMEOUT /T 5
)
GOTO End

:WindowsClient
if exist "C:\Trunk2016\WindowsClient" (
    if not exist "C:\Trunk2016\WindowsClient\libboost_locale-vc110-mt-1_56.lib" (
    xcopy C:\Trunk2016\Contribs\boost_1_56_0\stage\lib\*.* C:\Trunk2016\WindowsClient\
    )
    if not exist "C:\Trunk2016\WindowsClient\VMProtectSDK32.lib" (
    xcopy C:\Trunk2016\Contribs\VMProtectWin_2.13\lib\*.lib C:\Trunk2016\WindowsClient\
    )
    if not exist "C:\Trunk2016\WindowsClient\libcurl_a.lib" (
    xcopy "C:\Trunk2016\Contribs\windows\x86\curl\curl-7.43.0\build\Win32\VC11\DLL Release - DLL OpenSSL\libcurl_a.lib" C:\Trunk2016\WindowsClient\
    )
    if not exist "C:\Trunk2016\WindowsClient\zlib.lib" (
    xcopy C:\Trunk2016\zlib\win\bin\Release\*.lib C:\Trunk2016\WindowsClient\
    )
    color 02
    ECHO All the folders has been copied, have a good luck!
    TIMEOUT /T 3
) else ( 
  color 04
  ECHO Failed to copy the files, check if your folders are intact.
  ECHO Make sure you've extracted the Source and Contribs correctly.
  TIMEOUT /T 5
)
GOTO End


:RCCService
if exist "C:\Trunk2016\RCCService" (
    if not exist "C:\Trunk2016\RCCService\libboost_locale-vc110-mt-1_56.lib" (
    xcopy C:\Trunk2016\Contribs\boost_1_56_0\stage\lib\*.* C:\Trunk2016\RCCService\
    )
    if not exist "C:\Trunk2016\RCCService\VMProtectSDK32.lib" (
    xcopy C:\Trunk2016\Contribs\VMProtectWin_2.13\lib\*.lib C:\Trunk2016\RCCService\
    )
    if not exist "C:\Trunk2016\RCCService\libcurl_a.lib" (
    xcopy "C:\Trunk2016\Contribs\windows\x86\curl\curl-7.43.0\build\Win32\VC11\DLL Release - DLL OpenSSL\libcurl_a.lib" C:\Trunk2016\RCCService\
    )
    if not exist "C:\Trunk2016\RCCService\zlib.lib" (
    xcopy C:\Trunk2016\zlib\win\bin\Release\*.lib C:\Trunk2016\RCCService\
    )
    color 02
    ECHO All the folders has been copied, have a good luck!
    TIMEOUT /T 3
) else ( 
  color 04
  ECHO Failed to copy the files, check if your folders are intact.
  ECHO Make sure you've extracted the Source and Contribs correctly.
  TIMEOUT /T 5
)
GOTO End

:RobloxStudio
if exist "C:\Trunk2016\RobloxStudio" (
    if not exist "C:\Trunk2016\RobloxStudio\libboost_locale-vc110-mt-1_56.lib" (
    xcopy C:\Trunk2016\Contribs\boost_1_56_0\stage\lib\*.* C:\Trunk2016\RobloxStudio\
    )
    if not exist "C:\Trunk2016\RobloxStudio\VMProtectSDK32.lib" (
    xcopy C:\Trunk2016\Contribs\VMProtectWin_2.13\lib\*.lib C:\Trunk2016\RobloxStudio\
    )
    if not exist "C:\Trunk2016\RobloxStudio\libcurl_a.lib" (
    xcopy "C:\Trunk2016\Contribs\windows\x86\curl\curl-7.43.0\build\Win32\VC11\DLL Release - DLL OpenSSL\libcurl_a.lib" C:\Trunk2016\RobloxStudio\
    )
    if not exist "C:\Trunk2016\RobloxStudio\zlib.lib" (
    xcopy C:\Trunk2016\zlib\win\bin\Release\*.lib C:\Trunk2016\RobloxStudio\
    )
    color 02
    ECHO All the folders has been copied, have a good luck!
    TIMEOUT /T 3
) else ( 
  color 04
  ECHO Failed to copy the files, check if your folders are intact.
  ECHO Make sure you've extracted the Source and Contribs correctly.
  TIMEOUT /T 5
)
GOTO End

:End
