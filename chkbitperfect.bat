@echo off

echo Checking Built ROM with Original ROM...
IF EXIST s2built.bin ( fc /b s2built.bin s2.na.bin 
)else echo s2built.bin does not exist.

pause
