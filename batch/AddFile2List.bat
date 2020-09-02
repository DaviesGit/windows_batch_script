@echo off
set LIST_FILE=list.txt
:_loop
if "%~1"=="" goto _loop_end
echo %~1 >> "%LIST_FILE%"
shift
goto _loop
:_loop_end