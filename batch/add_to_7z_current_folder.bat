call ".bat"
set CURRENT_PATH=%~dp0
:_loop
if "%~1"=="" goto _loop_end
7z a "%CURRENT_PATH%%~nx1.7z" "%~1"
shift
goto _loop
:_loop_end