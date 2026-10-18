@echo off
setlocal EnableExtensions
title Backend-OS - split.py, git add, commit, push

set "REPO_DIR=%~dp0"
pushd "%REPO_DIR%" >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Cannot open repository directory: "%REPO_DIR%"
    exit /b 1
)

if not exist "split.py" (
    echo [ERROR] Missing split.py in "%REPO_DIR%"
    goto :FAIL
)

if not exist "gpt_agent.exe" (
    echo [ERROR] Missing gpt_agent.exe in "%REPO_DIR%"
    goto :FAIL
)

if not exist "git_push.bat" (
    echo [ERROR] Missing git_push.bat in "%REPO_DIR%"
    goto :FAIL
)

where py >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python launcher "py" was not found in PATH.
    goto :FAIL
)

echo [1/4] Running split.py...
py -3 "%REPO_DIR%split.py"
if errorlevel 1 (
    echo [ERROR] split.py failed. Git add, commit, and push were skipped.
    goto :FAIL
)

echo [2/4] Staging generated artifacts and this automation script...
git add -A -- "gpt_agent.exe.part*" "manifest.json" "Backend-OS_split-py_git-add-commit_git-push.bat"
if errorlevel 1 (
    echo [ERROR] git add failed. Commit and push were skipped.
    goto :FAIL
)

git diff --cached --quiet
if errorlevel 2 (
    echo [ERROR] Could not inspect staged changes.
    goto :FAIL
)
if not errorlevel 1 (
    echo [INFO] No staged changes. Commit will be skipped.
    goto :PUSH
)

echo [3/4] Creating commit...
git commit -m "update"
if errorlevel 1 (
    echo [ERROR] git commit failed. Push was skipped.
    goto :FAIL
)

:PUSH
echo [4/4] Running git_push.bat...
call "%REPO_DIR%git_push.bat"
set "PUSH_EXIT=%ERRORLEVEL%"

if not "%PUSH_EXIT%"=="0" (
    echo [ERROR] git_push.bat failed with exit code %PUSH_EXIT%.
    popd
    exit /b %PUSH_EXIT%
)

echo [SUCCESS] Backend-OS split, commit, and push flow completed.
popd
exit /b 0

:FAIL
set "FAIL_EXIT=%ERRORLEVEL%"
if "%FAIL_EXIT%"=="0" set "FAIL_EXIT=1"
popd
exit /b %FAIL_EXIT%
