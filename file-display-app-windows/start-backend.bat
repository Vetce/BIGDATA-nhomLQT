@echo off
REM Start Backend Server Only

echo.
echo ===============================================================
echo   Starting Backend Server
echo ===============================================================
echo.

REM Get the path to the parent directory
for %%I in ("%~dp0..") do set PARENT_DIR=%%~fI
set APP_DIR=%PARENT_DIR%\file-display-app
set SERVER_DIR=%APP_DIR%\server

echo [INFO] Server directory: %SERVER_DIR%
echo.

REM Check if server directory exists
if not exist "%SERVER_DIR%" (
    echo [ERROR] Could not find server directory: %SERVER_DIR%
    pause
    exit /b 1
)

REM Check if Node.js is installed
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed!
    echo Please download and install from https://nodejs.org
    pause
    exit /b 1
)

echo [INFO] Starting Backend Server on http://localhost:5000
echo [INFO] Press Ctrl+C to stop the server
echo.

cd /d "%SERVER_DIR%"
node index.js

pause
