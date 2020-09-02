rem @echo off
call ".bat"
set SCREENSHOT_INTERVAL=1
set SCREENSHOT_STORE_PATH=T:\Screenshot

setlocal enabledelayedexpansion
	:SCREENSHOT_LOOP
	set FILE_NAME=%date:~6,4%_%date:~0,2%_%date:~3,2%_%time:~0,2%_%time:~3,2%_%time:~6,2%_%time:~9,2%.png
	set FILE_NAME=!FILE_NAME: =0!
	nircmd savescreenshot "%SCREENSHOT_STORE_PATH%\!FILE_NAME!"
	echo screenshot file was taken "%SCREENSHOT_STORE_PATH%\!FILE_NAME!"
	sleep %SCREENSHOT_INTERVAL%
	goto SCREENSHOT_LOOP
endlocal



