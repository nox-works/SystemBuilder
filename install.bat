@echo off
setlocal enabledelayedexpansion

set "SB_DIR=%~dp0"
set "OPENCODE_DIR=%USERPROFILE%\.config\opencode"
set "AGENT_TARGET=%OPENCODE_DIR%\agent\system-builder"
set "COMMAND_TARGET=%OPENCODE_DIR%\command"
set "CONTEXT_TARGET=%OPENCODE_DIR%\context\system-builder"

echo.
echo ============================================================
echo  SystemBuilder — Installation
echo ============================================================
echo.

echo [1/5] Creating directories...
if not exist "%AGENT_TARGET%" mkdir "%AGENT_TARGET%"
if not exist "%CONTEXT_TARGET%" mkdir "%CONTEXT_TARGET%"
if not exist "%CONTEXT_TARGET%\concepts" mkdir "%CONTEXT_TARGET%\concepts"
if not exist "%CONTEXT_TARGET%\guides" mkdir "%CONTEXT_TARGET%\guides"
if not exist "%CONTEXT_TARGET%\lookup" mkdir "%CONTEXT_TARGET%\lookup"
if not exist "%CONTEXT_TARGET%\examples" mkdir "%CONTEXT_TARGET%\examples"
if not exist "%CONTEXT_TARGET%\errors" mkdir "%CONTEXT_TARGET%\errors"

echo [2/5] Installing agent file...
copy /Y "%SB_DIR%agent\system-builder.md" "%AGENT_TARGET%\" >nul 2>&1
echo   Agent installed.

echo [3/5] Installing command file...
copy /Y "%SB_DIR%command\system.md" "%COMMAND_TARGET%\" >nul 2>&1
echo   Command installed.

echo [4/5] Installing context files...
xcopy /E /Y "%SB_DIR%context\*" "%CONTEXT_TARGET%\" >nul 2>&1
echo   Context files installed.

echo [5/5] Verifying...
set VERIFY_OK=1
if not exist "%AGENT_TARGET%\system-builder.md" set VERIFY_OK=0
if not exist "%COMMAND_TARGET%\system.md" set VERIFY_OK=0

if %VERIFY_OK% equ 1 (
    echo.
    echo ============================================================
    echo  ✅ SystemBuilder installed successfully!
    echo ============================================================
    echo.
    echo  /system build a {system_type} on {topic}
    echo.
    echo  Types: @compendium @course @playbook @framework
    echo         @encyclopedia @toolkit @manifesto @knowledge-graph
) else (
    echo  ❌ Installation incomplete.
)
echo.
pause
