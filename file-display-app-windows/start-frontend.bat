@echo off
REM Start Frontend Application Only

echo.
echo ===============================================================
echo   Starting Frontend Application
echo ===============================================================
echo.

REM Get the path to the parent directory
for %%I in ("%~dp0..") do set PARENT_DIR=%%~fI
set APP_DIR=%PARENT_DIR%\file-display-app

echo [INFO] Application directory: %APP_DIR%
echo.

REM Check if app directory exists
if not exist "%APP_DIR%" (
    echo [ERROR] Could not find application directory: %APP_DIR%
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

echo [INFO] Frontend Application starting at http://localhost:3000
echo [INFO] IMPORTANT: Make sure the backend server is running first!
echo [INFO] Run start-backend.bat in another Command Prompt window
echo [INFO] Press Ctrl+C to stop
echo.

cd /d "%APP_DIR%"
npm start

pause
