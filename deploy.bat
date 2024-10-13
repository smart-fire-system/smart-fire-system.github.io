@echo off
setlocal

set /p message="Enter commit message (default: 'deploy'): "

if "%message%"=="" (
    set message=deploy
)

cd ../fire_alarm_system

call flutter build web

cd ../smart-fire-system.github.io

xcopy /s /y /i "..\fire_alarm_system\build\web\*" .

git add .

git commit -m "%message%"

git push

pause

endlocal
