@echo off
set dt=%date:~6,4%_%date:~0,2%_%date:~3,2%
:_loop
if "%~1"=="" goto _loop_end
"S:\ApplicationBinary\7-ZIP\7z.exe" a "\%~n1.7z" "%~1"
shift
goto _loop
:_loop_end