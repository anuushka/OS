@echo off
echo %ComputerName%
net share temp=C:\%ComputerName%\temp
:here