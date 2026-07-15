@echo off
echo ========================================
echo Ghep noi file gpt_agent.exe
echo ========================================
echo.

if not exist "gpt_agent.exe.part1" (
    echo [LOI] Khong tim thay gpt_agent.exe.part1!
    pause
    exit /b
)

if not exist "gpt_agent.exe.part2" (
    echo [LOI] Khong tim thay gpt_agent.exe.part2!
    pause
    exit /b
)

echo Dang ghep file...
copy /b gpt_agent.exe.part1 + gpt_agent.exe.part2 gpt_agent.exe >nul

if exist "gpt_agent.exe" (
    echo.
    echo [THANH CONG] Da tao xong file gpt_agent.exe!
    echo Ban co the chay file gpt_agent.exe bay gio.
) else (
    echo.
    echo [LOI] Ghep file that bai!
)

echo.
pause
