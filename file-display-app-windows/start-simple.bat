@echo off
REM BIGDATA File Display App - Simple Windows Start Script

echo.
echo ===============================================================
echo   BIGDATA File Display App
echo ===============================================================
echo.

REM Navigate to app directory
cd /d "D:\fileht_bigdata\BIGDATA-nhomLQT\file-display-app"

echo [1/2] Starting Backend Server on http://localhost:5000...
echo Please wait...
start "BIGDATA Backend Server" cmd /k "cd server && node index.js"

echo [2/2] Waiting for backend to start...
timeout /t 5 /nobreak >nul

echo.
echo Starting Frontend Application on http://localhost:3000...
echo Browser will open automatically when ready...
echo.

npm start

echo.
pause
