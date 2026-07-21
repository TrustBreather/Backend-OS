@echo off
setlocal
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0join_gpt_agent.ps1"
if errorlevel 1 exit /b 1
