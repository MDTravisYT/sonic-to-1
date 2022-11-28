@echo off

IF EXIST out.bin move /Y out.bin out.prev.bin >NUL
asm68k.exe /k /p /o ae-,c+ raw.asm, out.bin > log.txt
del out.prev.bin