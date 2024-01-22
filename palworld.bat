set "palworld_path=C:\Program Files (x86)\Steam\steamapps\common\PalServer"

set "backup_path=C:\Users\Administrator\Desktop\backup"

set interval=10800

:loop
echo [%date% %time%] Backup server data...

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set datetime=%%a
set datestamp=%datetime:~0,8%
set timestamp=%datetime:~8,6%

set year=%datestamp:~0,4%
set month=%datestamp:~4,2%
set day=%datestamp:~6,2%
set hour=%timestamp:~0,2%
set minute=%timestamp:~2,2%
set second=%timestamp:~4,2%

set foldername=%year%-%month%-%day%_%hour%-%minute%-%second%

xcopy "%palworld_path%\Pal\Saved" "%backup_path%\Backup_%foldername%" /E /H /C /I

echo [%date% %time%] Restart server...
taskkill /f /im "PalServer-Win64-Test-Cmd.exe" 2>nul

start  "" "%palworld_path%\PalServer.exe"
echo [%date% %time%] Server restarted!

timeout /t %interval%

goto loop