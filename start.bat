@echo off
TITLE Run A program and push a button after.
COLOR 0A
:start
::Server name
set headertitle= Changethistowhateveritsjustforlooks
::File to Start location
set FileyouwanttoStartLocation="C:\Program Files\Shotcut\"
::File to this files location
set ThisFilesLocation="C:\ThisFolder"
::Sets title for terminal (DONT edit)
title %headertitle% batch
echo (%time%) %headertitle% started.
setlocal EnableDelayedExpansion
:: _______________________________________________________________

goto :startprogramyouwanttorun
:checkprogramyouwanttorun
tasklist /fi "imagename eq shotcut.exe" 2>NUL | find /i /n "shotcut.exe">NUL
if "%ERRORLEVEL%"=="0" goto :pushkeyboardbutton
cls
echo Program you want to run is not running, taking care of it..
goto startprogramyouwanttorun

::turned_off_canbe_usefforother_stuffloopchecktoseeifprogramyouwantorunisrunning
FOR /L %%s IN (5,-1,0) DO (
    cls
    echo Program you want to run is running. Checking again in %%s seconds.. 
    timeout 1 >nul
)
goto checkprogramyouwanttorun

goto startprogramyouwanttorun
 
:startprogramyouwanttorun
echo Starting File you want to run.
timeout 1 >nul
cls
echo Starting File you want to run..
timeout 1 >nul
cls
echo Starting File you want to run...
timeout 1 >nul
cls
::changedirectorytofileyyouwanttostart
cd "%FileyouwanttoStartLocation%"
::tell_it_start_and_its_name
start shotcut.exe
timeout 10 >nul
cd "%ThisFilesLocation%"
goto checkprogramyouwanttorun
:pushkeyboardbutton
timeout 10 >nul
wscript /nologo keyboardpress.vbs
timeout 3 >nul
pause




