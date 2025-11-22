@echo off
REM BIGDATA File Display App - Port Cleanup Tool

echo.
echo ===============================================================
echo   BIGDATA File Display App - Port Cleanup Tool
echo ===============================================================
echo.

REM Check for Node processes
echo [1/2] Checking for running Node.js processes...
tasklist | findstr "node.exe" >nul
if %errorlevel% equ 0 (
    echo   Found running Node.js processes
    echo   Stopping all Node.js processes...
    taskkill /IM node.exe /F
    if %errorlevel% equ 0 (
        echo   ✓ All Node.js processes stopped
    ) else (
        echo   Could not stop all processes
    )
) else (
    echo   ✓ No running Node.js processes found
)
echo.

REM Wait and restart
echo [2/2] Waiting and restarting services...
timeout /t 3 /nobreak >nul
echo   ✓ Ready to start application
echo.

echo ===============================================================
echo   Cleanup Complete
echo ===============================================================
echo.
echo You can now safely run: start.bat
echo.

pause
