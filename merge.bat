@echo off
powershell -ExecutionPolicy Bypass -File "%~dp0merge.ps1"

echo.
echo Merge completed.
set /p delparts="Do you want to delete the part files after merging? (y/n): "
set delparts=%delparts: =%
if /i "%delparts%"=="y" (
    del /q "%~dp0gpt_agent.exe.part*"
    echo Part files deleted.
) else (
    echo Part files kept.
)
pause