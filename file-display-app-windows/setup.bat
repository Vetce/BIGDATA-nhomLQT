@echo off
REM BIGDATA File Display App - Windows Setup Script

echo.
echo ===============================================================
echo   BIGDATA File Display App - Windows Setup
echo ===============================================================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed!
    echo Please download and install Node.js 14+ from https://nodejs.org
    pause
    exit /b 1
)

REM Display Node.js and npm versions
echo [INFO] Checking Node.js installation...
node -v
npm -v
echo.

REM Set the app directory (adjust this path for Windows)
for %%I in ("%~dp0..\") do set PARENT_DIR=%%~fI
set APP_DIR=%PARENT_DIR%\file-display-app
echo [INFO] Application directory: %APP_DIR%
echo.

REM Navigate to app directory
cd /d "%APP_DIR%"
if %errorlevel% neq 0 (
    echo [ERROR] Could not find directory: %APP_DIR%
    echo Please update the APP_DIR path in this script.
    pause
    exit /b 1
)

REM Install frontend dependencies
echo [STEP 1/2] Installing frontend dependencies...
call npm install
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install frontend dependencies
    pause
    exit /b 1
)
echo [SUCCESS] Frontend dependencies installed!
echo.

REM Install backend dependencies
echo [STEP 2/2] Installing backend dependencies...
cd server
call npm install
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install backend dependencies
    pause
    exit /b 1
)
cd ..
echo [SUCCESS] Backend dependencies installed!
echo.

echo ===============================================================
echo   Installation Complete!
echo ===============================================================
echo.
echo To start the application, you have two options:
echo.
echo   Option 1 (Recommended): Run start.bat
echo   - Automatically starts both backend and frontend
echo.
echo   Option 2 (Manual):
echo   - Run start-backend.bat in one window
echo   - Run start-frontend.bat in another window
echo.
echo Frontend URL: http://localhost:3000
echo Backend API:  http://localhost:5000
echo.
pause
