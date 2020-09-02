@echo off
call ".bat"
:_loop
if "%~1"=="" goto _loop_end
for /F "usebackq delims=" %%a in ("%~1") do (
	if not exist "O:\Download\%~n1\%%~nxa" (
		start "" uget --proxy-type=1  --folder="O:\Download\%~n1" --quiet "%%a"
	)
)
shift
goto _loop
:_loop_end