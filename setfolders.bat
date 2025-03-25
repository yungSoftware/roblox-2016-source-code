REM Written by yungDoom
REM LOGIC: It copies the necessary files from various place to folder you've selected.

REM Removing unnecessary folders
if exist "C:\Trunk2016\Contribs\hlsl2glslfork" if exist ":\Trunk2016\Contribs\glsl-optimizer" (
rmdir C:\Trunk2016\Contribs\hlsl2glslfork
rmdir C:\Trunk2016\Contribs\glsl-optimizer
)

@ECHO OFF
CLS
ECHO 1. RobloxStudio
ECHO 2. RCCService
ECHO 3. WindowsClient
Echo 4. Custom Location
Echo 5. Clear all the libraries
Echo 6. Clear all the libraries *from Custom Location*
Echo 7. Help
Echo 8. Exit
Echo.
if exist ".git\" (
cecho {0A}You're using Git Version of the source, cool!{#}
) else (
cecho {0C}You're using LOCAL Git Version of the source, not cool!{#}
)
ECHO.
ECHO.

CHOICE /C 12345678 /M "Enter your choice 1-8:"

:: This is where it gets your input
IF ERRORLEVEL 8 GOTO Exit
IF ERRORLEVEL 7 GOTO Help
IF ERRORLEVEL 6 GOTO ClearLocation
IF ERRORLEVEL 5 GOTO Clear
IF ERRORLEVEL 4 GOTO CustomPath
IF ERRORLEVEL 3 GOTO WindowsClient
IF ERRORLEVEL 2 GOTO RCCService
IF ERRORLEVEL 1 GOTO RobloxStudio

:Exit :: the command line closes.
exit
GOTO End

:Help
ECHO.

ECHO This batch file helps you copying the libraries
ECHO Its an important process to build the game so make sure you do it
ECHO Open this bat file again to start selecting.

ECHO.
TIMEOUT /T 10
GOTO End

:ClearLocation
ECHO.

cecho {0E}WARNING: Your input should start with: C:\Trunk2016{#}

ECHO.
set /p loco=Enter the path where you want the files to go: 
if exist "%loco%" (
    cd /d %loco%
    del *.lib
    cd /d C:\Trunk2016\
    ECHO.

    cecho {0A}All the necessary files from the folder you've choosed has been cleared.{#}

    ECHO.
    TIMEOUT /T 3 
) else (
  ECHO.

  cecho {0C}Failed to do the task{#}
  ECHO.
  cecho {0C}Make sure you've extracted the Source and Contribs correctly.{#}
  
  ECHO.
  TIMEOUT /T 5
)
GOTO End

:Clear
if exist "C:\Trunk2016\" (
  if exist C:\Trunk2016\WindowsClient (
    cd /d C:\Trunk2016\WindowsClient
    del *.lib )
  if exist C:\Trunk2016\RCCService (
    cd /d C:\Trunk2016\RCCService
    del *.lib )
 if exist C:\Trunk2016\RobloxStudio (
    cd /d C:\Trunk2016\RobloxStudio
    del *.lib )
    cd /d C:\Trunk2016\
    ECHO.

    cecho {0A}All the necessary folders have been cleared.{#}

    ECHO.
    TIMEOUT /T 3 
) else ( 
  ECHO.

  cecho {0C}Failed to do the task{#}
  ECHO.
  cecho {0C}Make sure you've extracted the Source and Contribs correctly.{#}
  
  ECHO.
  TIMEOUT /T 5
)
GOTO End

:CustomPath
ECHO.

cecho {0E}WARNING: Your input should start with: C:\Trunk2016{#}

ECHO.
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
    ECHO.

    cecho {0A}All the folders has been copied, have a good luck!{#}
    
    ECHO.
    TIMEOUT /T 3 
) else ( 
  ECHO.
   
  cecho {0C}Failed to do the task{#}
  ECHO.
  cecho {0C}Make sure you've extracted the Source and Contribs correctly.{#}
  
  ECHO.
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
    ECHO.
    
    cecho {0A}All the folders has been copied, have a good luck!{#}
    
    ECHO.
    TIMEOUT /T 3
) else ( 
  ECHO.

  cecho {0C}Failed to do the task{#}
  ECHO.
  cecho {0C}Make sure you've extracted the Source and Contribs correctly.{#}
  
  ECHO.
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
    ECHO.
 
    cecho {0A}All the folders has been copied, have a good luck!{#}
  
    ECHO.
    TIMEOUT /T 3
) else ( 
  ECHO.

  cecho {0C}Failed to do the task{#}
  ECHO.
  cecho {0C}Make sure you've extracted the Source and Contribs correctly.{#}
  
  ECHO.
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
    ECHO.
    
    cecho {0A}All the folders has been copied, have a good luck!{#}
    
    ECHO.
    TIMEOUT /T 3
) else ( 
  ECHO.

  cecho {0C}Failed to do the task{#}
  ECHO.
  cecho {0C}Make sure you've extracted the Source and Contribs correctly.{#}

  ECHO.
  TIMEOUT /T 5
)
GOTO End

:End
