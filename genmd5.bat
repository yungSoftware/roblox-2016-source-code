@echo off
for /f "skip=1 tokens=*" %%A in ('Certutil -hashfile WindowsClient\Win32\Release\RobloxPlayerBeta.exe MD5') do (
    echo RobloxPlayerBeta MD5: %%A
    goto :end
)
:end
pause