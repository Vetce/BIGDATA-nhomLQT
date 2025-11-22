@echo off
REM BIGDATA File Display App - Start Both Backend and Frontend

echo.
echo ===============================================================
echo   Starting BIGDATA File Display App
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
    echo Please make sure the file-display-app folder exists in the parent directory.
    pause
    exit /b 1
)

REM Start backend in a new window
echo [INFO] Starting backend server on http://localhost:5000...
start "BIGDATA Backend Server" cmd /k "cd /d "%APP_DIR%\server" && node index.js"

REM Wait for backend to start
timeout /t 5 /nobreak >nul

REM Start frontend
echo [INFO] Starting frontend application on http://localhost:3000...
cd /d "%APP_DIR%"
npm start

echo.
echo [INFO] Application is running!
echo Frontend: http://localhost:3000
echo Backend:  http://localhost:5000
echo.
