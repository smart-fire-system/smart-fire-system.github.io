@echo off
setlocal

set /p message="Enter commit message (default: 'deploy'): "
if "%message%"=="" (
    set message=deploy
)

echo --------------------- Building Web
cd ../fire_alarm_system
call flutter build web

echo --------------------- Copying Files
cd ../smart-fire-system.github.io
xcopy /s /y /i "..\fire_alarm_system\build\web\*" .

echo --------------------- Git Commit
git add .
git commit -m "%message%"

echo --------------------- Git Push
git push
pause

endlocal
