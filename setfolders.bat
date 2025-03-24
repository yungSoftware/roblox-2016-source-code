REM Change C:\ to any drive you letter you want
REM Written by yungDoom

@ECHO OFF
CLS
ECHO 1. RobloxStudio
ECHO 2. RCCService
ECHO 3. WindowsClient
Echo 4. Custom Path
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
set /p in=Enter the path where you want the files to go
xcopy C:\Trunk2016\Contribs\boost_1_56_0\stage\lib\*.*
%in%
    xcopy C:\Trunk2016\Contribs\VMProtectWin_2.13\lib\*.lib
%in%
    xcopy "C:\Trunk2016\Contribs\windows\x86\curl\curl-7.43.0\build\Win32\VC11\DLL Release - DLL OpenSSL\libcurl_a.lib" %in%
    xcopy C:\Trunk2016\zlib\win\bin\Release\*.lib %in%
    color 02
    ECHO All the folders has been copied, have a good luck!
    TIMEOUT /T 3
GOTO End

:WindowsClient
if exist "C:\Trunk2016\WindowsClient" (
    xcopy C:\Trunk2016\Contribs\boost_1_56_0\stage\lib\*.* C:\Trunk2012\WindowsClient\
    xcopy C:\Trunk2016\Contribs\VMProtectWin_2.13\lib\*.lib C:\Trunk2012\WindowsClient\
    xcopy "C:\Trunk2016\Contribs\windows\x86\curl\curl-7.43.0\build\Win32\VC11\DLL Release - DLL OpenSSL\libcurl_a.lib" C:\Trunk2012\WindowsClient\
    xcopy C:\Trunk2016\zlib\win\bin\Release\*.lib C:\Trunk2012\WindowsClient\
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
    xcopy C:\Trunk2016\Contribs\boost_1_56_0\stage\lib\*.* C:\Trunk2012\RCCService\
    xcopy C:\Trunk2016\Contribs\VMProtectWin_2.13\lib\*.lib C:\Trunk2012\RCCService\
    xcopy "C:\Trunk2016\Contribs\windows\x86\curl\curl-7.43.0\build\Win32\VC11\DLL Release - DLL OpenSSL\libcurl_a.lib" C:\Trunk2012\RCCService\
    xcopy C:\Trunk2016\zlib\win\bin\Release\*.lib C:\Trunk2012\RCCService\
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
    xcopy C:\Trunk2016\Contribs\boost_1_56_0\stage\lib\*.* C:\Trunk2012\RobloxStudio\
    xcopy C:\Trunk2016\Contribs\VMProtectWin_2.13\lib\*.lib C:\Trunk2012\RobloxStudio\
    xcopy "C:\Trunk2016\Contribs\windows\x86\curl\curl-7.43.0\build\Win32\VC11\DLL Release - DLL OpenSSL\libcurl_a.lib" C:\Trunk2012\RobloxStudio\
    xcopy C:\Trunk2016\zlib\win\bin\Release\*.lib C:\Trunk2012\RobloxStudio\
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