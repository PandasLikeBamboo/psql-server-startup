@echo off

rem REMEMBER TO UPLOAD THE config.txt WITH BLANK PATH!!!

rem sets a path to config file 
:init
set "ConfigFile=config.txt"
for /f "delims=" %%i in (%ConfigFile%) do (
	set "%%i"
)
 goto setpath


:setpath
echo Paste path to ./data folder in your PostgreSQL server directory:
@set /P "DataFolderPath="
rem here set the value of the DataFolderPath variable in the config file
echo DataFolderPath=%DataFolderPath% > config.txt
echo Path set to: %DataFolderPath%
pause
goto main

:main
echo.
echo What action do you want to perform?
echo.
echo 1 start
echo 2 stop
echo 3 restart
echo 4 set path
echo 5 exit (exits cmd)
echo.
@set /P "action=User input: "
if "%action%" == "1" goto start
if "%action%" == "2" goto stop
if "%action%" == "3" goto restart
if "%action%" == "4" goto setpath
rem add option to reset the path
if "%action%" == "5" goto exit
echo Invalid input
goto main

:start
echo Starting the server
echo.
pg_ctl -D "%path%" start 
goto main

:stop
echo Stopping the server
echo.
pg_ctl -D "%path%" stop
goto main

:restart
echo Restarting the server
echo.
pg_ctl -D "%path%" restart
goto main	

:exit 
pause
exit /B

:test
pause