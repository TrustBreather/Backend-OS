@echo off
setlocal
call "%~dp0join_gpt_agent.bat"
if errorlevel 1 exit /b 1
pause
