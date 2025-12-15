@echo off
setlocal

:: Configuration
set "PROJECT_PATH=/home/tahar/project/Maven/migraine-tracker"
set "APP_URL=http://localhost:3002"

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

:: Demarrage du serveur (en premier pour qu'il soit pret)
echo [Etape 2/3] Demarrage du serveur...
echo.
echo ========================================================
echo   SERVEUR EN COURS D'EXECUTION
echo   
echo   L'application sera accessible sur: %APP_URL%
echo   (Le navigateur s'ouvrira dans 5 secondes)
echo   
echo   IMPORTANT: Ne fermez pas cette fenetre !
echo ========================================================
echo.

:: Lancer le navigateur en arriere-plan apres un delai
start /b cmd /c "timeout /t 5 >nul && start "" "%APP_URL%""

:: Execution du serveur
wsl bash -l -c "cd %PROJECT_PATH% && npm run dev -- -p 3002"

echo.
echo Le serveur s'est arrete.
pause
