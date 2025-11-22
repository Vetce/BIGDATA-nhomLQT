@echo off
REM BIGDATA File Display App - Diagnostic Tool

echo.
echo ===============================================================
echo   BIGDATA File Display App - Diagnostic Tool
echo ===============================================================
echo.

REM Check Node.js installation
echo [1/5] Checking Node.js installation...
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo   ❌ Node.js is NOT installed
    echo   Please download and install from https://nodejs.org
) else (
    echo   ✓ Node.js is installed
    node --version
)
echo.

REM Check npm installation
echo [2/5] Checking npm installation...
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo   ❌ npm is NOT installed
) else (
    echo   ✓ npm is installed
    npm --version
)
echo.

REM Check application directory
echo [3/5] Checking application directory...
for %%I in ("%~dp0..\") do set PARENT_DIR=%%~fI
set APP_DIR=%PARENT_DIR%\file-display-app

if exist "%APP_DIR%" (
    echo   ✓ Application directory found: %APP_DIR%
) else (
    echo   ❌ Application directory NOT found: %APP_DIR%
)
echo.

REM Check package.json files
echo [4/5] Checking package.json files...
if exist "%APP_DIR%\package.json" (
    echo   ✓ Frontend package.json found
) else (
    echo   ❌ Frontend package.json NOT found
)

if exist "%APP_DIR%\server\package.json" (
    echo   ✓ Backend package.json found
) else (
    echo   ❌ Backend package.json NOT found
)
echo.

REM Check node_modules
echo [5/5] Checking dependencies...
if exist "%APP_DIR%\node_modules" (
    echo   ✓ Frontend dependencies installed
) else (
    echo   ⚠ Frontend dependencies NOT installed - run setup.bat
)

if exist "%APP_DIR%\server\node_modules" (
    echo   ✓ Backend dependencies installed
) else (
    echo   ⚠ Backend dependencies NOT installed - run setup.bat
)
echo.

echo ===============================================================
echo   Diagnostic Summary
echo ===============================================================
echo.
echo Next Steps:
echo   1. If any checks failed, run: setup.bat
echo   2. To start the app, run: start.bat
echo.

pause
