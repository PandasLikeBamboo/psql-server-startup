@echo off
goto main

:main
echo.
echo What action do you want to perform?
echo.
echo 1 start
echo 2 stop
echo 3 restart
echo 4 exit (exits cmd)
echo.
@set /P "action=User input: "
if "%action%" == "1" goto start
if "%action%" == "2" goto stop
if "%action%" == "3" goto restart
if "%action%" == "4" goto exit
echo Invalid input
goto main

:start
echo Starting the server
echo.
pg_ctl -D "C:\Program Files\PostgreSQL\16\data" start 
goto main

:stop
echo Stopping the server
echo.
pg_ctl -D "C:\Program Files\PostgreSQL\16\data" stop
goto main

:restart
echo Restarting the server
echo.
pg_ctl -D "C:\Program Files\PostgreSQL\16\data" restart
goto main	

:exit 
pause
exit /B