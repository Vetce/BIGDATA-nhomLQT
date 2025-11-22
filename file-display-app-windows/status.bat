@echo off
REM BIGDATA File Display App - Status Checker

echo.
echo ===============================================================
echo   BIGDATA File Display App - Status Checker
echo ===============================================================
echo.

REM Check if servers are running
echo [INFO] Checking if application is running...
echo.

REM Check backend
netstat -ano | findstr ":5000" >nul 2>&1
if %errorlevel% equ 0 (
    echo   ✓ Backend is RUNNING on port 5000
    echo     Backend URL: http://localhost:5000
) else (
    echo   ✗ Backend is NOT running on port 5000
    echo     Start it with: start-backend.bat
)
echo.

REM Check frontend
netstat -ano | findstr ":3000" >nul 2>&1
if %errorlevel% equ 0 (
    echo   ✓ Frontend is RUNNING on port 3000
    echo     Frontend URL: http://localhost:3000
) else (
    echo   ✗ Frontend is NOT running on port 3000
    echo     Start it with: start-frontend.bat
)
echo.

REM Show Node processes
echo [INFO] Running Node.js processes:
tasklist | findstr "node.exe"
if %errorlevel% neq 0 (
    echo   (None found)
)
echo.

echo ===============================================================
echo   Instructions:
echo ===============================================================
echo.
echo   To START the app:
echo     → Double-click: start.bat
echo.
echo   To STOP the app:
echo     → Close the Command Prompt windows
echo     → Or double-click: cleanup.bat
echo.
echo   For more help:
echo     → See: README.md
echo     → See: QUICKSTART.txt
echo.

pause
