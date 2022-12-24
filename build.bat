@echo off

IF EXIST s2built.bin move /Y s2built.bin s2built.prev.bin >NUL
asm68k.exe /k /p /o ae-,c- sonic.asm, s2built.bin > log.txt, , sonic.lst
fixheadr.exe