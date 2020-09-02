@echo off
call ".bat"
:_loop
if "%~1"=="" goto _loop_end
call uglifyjs "%~1" -o "%~dpn1.min%~x1" -c
call uglifyjs "%~1" -o "%~dpn1.min.mangle%~x1" -c -m
call uglifyjs "%~1" -o "%~dpn1.beautify%~x1" -b
rem call javascript-obfuscator "%~d1%~p1%~n1.min.mangle%~x1" -o "%~d1%~p1%~n1.obfuscated%~x1"
call javascript-obfuscator "%~1" -o "%~dpn1.obfuscated%~x1"
shift
goto _loop
:_loop_end