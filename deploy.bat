@echo off
setlocal

REM Step 1: Navigate to the fire_alarm_system directory
cd ../fire_alarm_system

REM Step 2: Build the Flutter web app
call flutter build web

REM Step 3: Navigate to the smart-fire-system.github.io directory
cd ../smart-fire-system.github.io

REM Step 4: Copy all files from fire_alarm_system/build/web/*.* to the current directory with force replace
xcopy /s /y /i "..\fire_alarm_system\build\web\*" .

REM Step 5: Add all files to git
git add .

REM Step 6: Check if a commit message was passed to the script
if "%~1"=="" (
    set "message=deploy"
) else (
    set "message=%~1"
)

REM Step 7: Commit with the message
git commit -m "%message%"

REM Step 8: Push the changes to the repository
git push

REM Step 9: Pause the script at the end
pause

endlocal
