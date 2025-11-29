@echo off
setlocal

:: Configuration
set "PROJECT_PATH=/home/tahar/project/Maven/migraine-tracker"
set "APP_URL=http://localhost:3000"

title MigraineChecker Launcher
color 0A
echo.
echo ==========================================
echo   MIGRAINE CHECKER - LANCEUR
echo ==========================================
echo.

:: Verification WSL
echo [Etape 1/3] Verification de WSL...
wsl echo "OK" >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    color 0C
    echo ERREUR: WSL n'est pas disponible.
    echo.
    pause
    exit /b 1
)
echo   [OK] WSL est pret
echo.

:: Ouverture du navigateur
echo [Etape 2/3] Ouverture du navigateur...
start "" "%APP_URL%"
echo   [OK] Navigateur lance
echo.

:: Demarrage du serveur
echo [Etape 3/3] Demarrage du serveur...
echo.
echo ========================================================
echo   SERVEUR EN COURS D'EXECUTION
echo   
echo   L'application est accessible sur: %APP_URL%
echo   
echo   IMPORTANT: Ne fermez pas cette fenetre !
echo ========================================================
echo.

wsl bash -l -c "cd %PROJECT_PATH% && npm run dev -- -p 3000"

echo.
echo Le serveur s'est arrete.
pause
