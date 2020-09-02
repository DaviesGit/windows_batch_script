@echo off
call ".bat"
set PHONE_IP=192.168.2.111
set PHONE_PORT=5555
set dt=%date:~6,4%_%date:~0,2%_%date:~3,2%
set DIRECTORY_NAME=\%dt%

adb connect %PHONE_IP%:%PHONE_PORT%

FOR /F "tokens=*" %%i IN ('adb connect %PHONE_IP%:%PHONE_PORT%') do (
	set str_i=%%i
	goto SET_STATE_STATE
)
:SET_STATE_STATE_END

if NOT "%Connect_State%"=="true" (
	goto ERROR_CONNECT_FAILED
	)

rem adb pull /sdcard/tencent/QQ_Images T:\temp\pulled

md %DIRECTORY_NAME%

adb shell find "/sdcard/tencent/QQ_Images" -type f ! -name "\*.\*" -exec rm {} \;
adb shell rm -fiRr -f -rR "/sdcard/tencent/QQ_Images/QQEditPic"
adb pull "/sdcard/tencent/QQ_Images" "%DIRECTORY_NAME%\QQ_Images"
adb pull "/sdcard/Pictures/Screenshots" "%DIRECTORY_NAME%\Screenshots"
adb pull "/sdcard/Pictures/OpenCamera" "%DIRECTORY_NAME%\OpenCamera"

FOR /F "tokens=*" %%i IN ('adb shell ls "/sdcard/tencent/QQ_Images" ^| wc -l') do (
	set QQ_Images_count_android=%%i
)
FOR /F "tokens=*" %%i IN ('adb shell ls "/sdcard/Pictures/Screenshots" ^| wc -l') do (
	set Screenshots_count_android=%%i
)
FOR /F "tokens=*" %%i IN ('adb shell ls "/sdcard/Pictures/OpenCamera" ^| wc -l') do (
	set OpenCamera_count_android=%%i
)


FOR /F "tokens=*" %%i IN ('dir/b/a-d "%DIRECTORY_NAME%\QQ_Images" ^| find /v /c "::"') do (
	set QQ_Images_count_win=%%i
)
FOR /F "tokens=*" %%i IN ('dir/b/a-d "%DIRECTORY_NAME%\Screenshots" ^| find /v /c "::"') do (
	set Screenshots_count_win=%%i
)
FOR /F "tokens=*" %%i IN ('dir/b/a-d "%DIRECTORY_NAME%\OpenCamera" ^| find /v /c "::"') do (
	set OpenCamera_count_win=%%i
)

if not "%QQ_Images_count_win%"=="%QQ_Images_count_android%" goto ERROR_PICTURE_ACCOUNT
if not "%Screenshots_count_win%"=="%Screenshots_count_android%" goto ERROR_PICTURE_ACCOUNT
if not "%OpenCamera_count_win%"=="%OpenCamera_count_android%" goto ERROR_PICTURE_ACCOUNT
adb shell rm -fiRr -f -rR "/sdcard/tencent/QQ_Images"
adb shell rm -fiRr -f -rR "/sdcard/Pictures/Screenshots"
adb shell rm -fiRr -f -rR "/sdcard/Pictures/OpenCamera"
adb shell mkdir "/sdcard/tencent/QQ_Images"
adb shell mkdir "/sdcard/Pictures/Screenshots"
adb shell mkdir "/sdcard/Pictures/OpenCamera"



goto END


:SET_STATE_STATE
	if NOT "%str_i:already connected to=%"=="%str_i%" (
		set Connect_State=true
	) else (
		set Connect_State=false
	)
goto SET_STATE_STATE_END

:ERROR_CONNECT_FAILED
echo adb connect %PHONE_IP%:%PHONE_PORT% command failed!
goto END;

:ERROR_PICTURE_ACCOUNT
echo pictures copied amonut error!
goto END

:END

pause