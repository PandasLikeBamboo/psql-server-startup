@echo off
goto init
rem REMEMBER TO UPLOAD THE config.txt WITH BLANK PATH!!!

rem sets a path to config file 
:init
set "ConfigFile=config.txt"
for /f "delims=" %%i in (%ConfigFile%) do (
	set "%%i"
)
 goto setpath

:modifypath
echo %DataFolderPath%
pause
if "%DataFolderPath%" == "null" goto setpath
echo Current path to ./data folder: %DataFolderPath%
echo.
@set /P "choice=Do you want to change it? (y/n) "
if "%choice%" == "y" goto setpath
if "%choice%" == "n" goto main
echo Invalid choice.
goto modifypath

:setpath
echo Paste path to ./data folder in your PostgreSQL server directory:
@set /P "LocalDataFolderPath="
rem here set the value of the DataFolderPath variable in the config file
echo DataFolderPath=%LocalDataFolderPath% > %ConfigFile%
echo Path set to: %LocalDataFolderPath%
pause
goto main

:main
echo.
echo What action do you want to perform?
echo.
echo 1 start
echo 2 stop
echo 3 restart
echo 4 modify path
echo 5 exit (exits cmd)
echo.
@set /P "action=User input: "
if "%action%" == "1" goto start
if "%action%" == "2" goto stop
if "%action%" == "3" goto restart
if "%action%" == "4" goto modifypath
rem add option to reset the path
if "%action%" == "5" goto exit
echo Invalid input
goto main

:start
echo Starting the server
echo.
pg_ctl -D "%DataFolderPath%" start 
goto main

:stop
echo Stopping the server
echo.
pg_ctl -D "%DataFolderPath%" stop
goto main

:restart
echo Restarting the server
echo.
pg_ctl -D "%DataFolderPath%" restart
goto main	

:exit 
pause
exit /B

:test
pause