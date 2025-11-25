@echo off
setlocal

:: Configuration
set "DOWNLOADS_FOLDER=C:\Users\tahar\Downloads"
set "BACKUP_FOLDER=\\wsl.localhost\Ubuntu\home\tahar\project\Maven\migraine-tracker\sauvegardes"

echo ==========================================
echo   COPIE DES SAUVEGARDES MIGRAINE
echo ==========================================
echo.

:: Créer le dossier de sauvegarde s'il n'existe pas
if not exist "%BACKUP_FOLDER%" mkdir "%BACKUP_FOLDER%"

:: Copier tous les fichiers de sauvegarde migraine
echo Recherche des fichiers de sauvegarde...
for %%f in ("%DOWNLOADS_FOLDER%\migraine-backup-*.json") do (
    echo Copie de %%~nxf...
    copy "%%f" "%BACKUP_FOLDER%\" /Y
    echo   [OK] Copie dans %BACKUP_FOLDER%
)

echo.
echo ==========================================
echo   TERMINE !
echo ==========================================
pause
