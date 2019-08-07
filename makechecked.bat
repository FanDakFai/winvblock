@echo off
mkdir bin 2>nul
rem cmd /c makeutils
cmd /c makeutils0
cmd /c makeutils1
cmd /c makedriver c 32
cmd /c makedriver c 64
