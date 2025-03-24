REM Change C:\ to any drive letter you want
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

:Exit
exit
GOTO End

:CustomPath
set /p in=Enter the path where you want the files to go: 
ECHO WARNING: Your input should start with: C:\Trunk2016
xcopy C:\Trunk2016\Contribs\boost_1_56_0\stage\lib\*.* %in%
    xcopy C:\Trunk2016\Contribs\VMProtectWin_2.13\lib\*.lib %in%
    xcopy "C:\Trunk2016\Contribs\windows\x86\curl\curl-7.43.0\build\Win32\VC11\DLL Release - DLL OpenSSL\libcurl_a.lib" %in%
    xcopy C:\Trunk2016\zlib\win\bin\Release\*.lib %in%
    color 02
    ECHO All the folders has been copied, have a good luck!
    TIMEOUT /T 3
GOTO End

:WindowsClient
if exist "C:\Trunk2016\WindowsClient" (
    xcopy C:\Trunk2016\Contribs\boost_1_56_0\stage\lib\*.* C:\trunk2016\WindowsClient\
    xcopy C:\Trunk2016\Contribs\VMProtectWin_2.13\lib\*.lib C:\trunk2016\WindowsClient\
    xcopy "C:\Trunk2016\Contribs\windows\x86\curl\curl-7.43.0\build\Win32\VC11\DLL Release - DLL OpenSSL\libcurl_a.lib" C:\trunk2016\WindowsClient\
    xcopy C:\Trunk2016\zlib\win\bin\Release\*.lib C:\trunk2016\WindowsClient\
    color 02
    ECHO All the folders has been copied, have a good luck!
    TIMEOUT /T 3
) else ( 
  color 04
  mkdir "C:\Trunk2016\Contribs"
  ECHO Failed to copy the files, check if your folders are intact.
  ECHO Make sure you've extracted the Source and Contribs correctly.
  TIMEOUT /T 5
)

GOTO End


:RCCService
if exist "C:\Trunk2016\RCCService" (
    xcopy C:\Trunk2016\Contribs\boost_1_56_0\stage\lib\*.* C:\trunk2016\RCCService\
    xcopy C:\Trunk2016\Contribs\VMProtectWin_2.13\lib\*.lib C:\trunk2016\RCCService\
    xcopy "C:\Trunk2016\Contribs\windows\x86\curl\curl-7.43.0\build\Win32\VC11\DLL Release - DLL OpenSSL\libcurl_a.lib" C:\trunk2016\RCCService\
    xcopy C:\Trunk2016\zlib\win\bin\Release\*.lib C:\trunk2016\RCCService\
    color 02
    ECHO All the folders has been copied, have a good luck!
    TIMEOUT /T 3

) else ( 
  color 04
  mkdir "C:\Trunk2016\Contribs"
  ECHO Failed to copy the files, check if your folders are intact.
  ECHO Make sure you've extracted the Source and Contribs correctly.
  TIMEOUT /T 5
)

GOTO End

:RobloxStudio
if exist "C:\Trunk2016\RobloxStudio" (
    xcopy C:\Trunk2016\Contribs\boost_1_56_0\stage\lib\*.* C:\trunk2016\RobloxStudio\
    xcopy C:\Trunk2016\Contribs\VMProtectWin_2.13\lib\*.lib C:\trunk2016\RobloxStudio\
    xcopy "C:\Trunk2016\Contribs\windows\x86\curl\curl-7.43.0\build\Win32\VC11\DLL Release - DLL OpenSSL\libcurl_a.lib" C:\trunk2016\RobloxStudio\
    xcopy C:\Trunk2016\zlib\win\bin\Release\*.lib C:\trunk2016\RobloxStudio\
    color 02
    ECHO All the folders has been copied, have a good luck!
    TIMEOUT /T 3

) else ( 
  color 04
  mkdir "C:\Trunk2016\Contribs"
  ECHO Failed to copy the files, check if your folders are intact.
  ECHO Make sure you've extracted the Source and Contribs correctly.
  TIMEOUT /T 5
)

GOTO End

:End
