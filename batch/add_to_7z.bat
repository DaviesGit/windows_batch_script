call ".bat"
:_loop
if "%~1"=="" goto _loop_end
7z a "%~1.7z" "%~1"
shift
goto _loop
:_loop_end