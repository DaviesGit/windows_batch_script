rem  @echo off

%~d0
cd %~p0

:_loop
if "%~1"=="" goto _loop_end

if not exist "%~dpnx1\*" (
	mklink "%~nx1" "%~1"
) else (
	mklink /D "%~nx1" "%~1"
)
shift
goto _loop
:_loop_end