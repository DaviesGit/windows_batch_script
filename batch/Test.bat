

FOR /F "tokens=*" %%i IN ('adb shell ls "/sdcard/tencent/QQ_Images" "|" wc -l') do (
	set QQ_Images_count_android=%%i
)

:_loop
if "%~1"=="" goto _loop_end
shift
goto _loop
:_loop_end

pause
