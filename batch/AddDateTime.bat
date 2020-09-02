@echo off
rem set dt=%date:~6,4%_%date:~0,2%_%date:~3,2%
set dt=%date:~10,4%_%date:~4,2%_%date:~7,2%
:rename_loop
if "%~1"=="" goto rename_loop_end
ren %1 "%~n1_%dt%%~x1"
shift
goto rename_loop
:rename_loop_end