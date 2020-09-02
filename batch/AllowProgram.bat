@echo off
set dt=%date:~6,4%_%date:~0,2%_%date:~3,2%
:_loop
if "%~1"=="" goto _loop_end
netsh advfirewall firewall add rule name="Allow_%~n1" dir=out action=allow program="%~1" enable=yes
shift
goto _loop
:_loop_end