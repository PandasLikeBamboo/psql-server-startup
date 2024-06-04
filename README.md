
# PGSQL server management

Simple batch file for easier pgsql server management. 


## Environment Variables

To run this project, you will need to add the following paths to your `Path` variable:

`C:\..\PostgreSQL\<version>\bin`

`C:\..\PostgreSQL\<version>\lib`


In order to do that, open Run (`Win` + `R`) then type in `rundll32 sysdm.cpl,EditEnvironmentVariables` and hit enter. Under "System Variables" section find row called "Path", click on it and click edit.

A new "Edit environment variable" window will pop up. Click "New" and paste in the path to your `..\bin` directory that can be found in the PostgreSQL server directory. Repeat this step for `..\lib` folder.


## Running

Download and run the `pss.bat` file.

NOTE: the file won't work without the Environment Variables!!


