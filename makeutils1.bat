@echo off

mkdir bin 2>nul
call config.bat
set lib=%ddkdir%\lib

cd src



pushd .
call %ddkdir%\bin\setenv.bat %ddkdir% x64 wnet
popd

pushd .
cd loader
cl /I%CRT_INC_PATH% /I..\include /DWIN32_LEAN_AND_MEAN loader.c /Fe..\..\bin\loader64.exe /link /LIBPATH:%DDK_LIB_DEST%\%_BUILDARCH% /LIBPATH:%Lib%\crt\%_BUILDARCH% setupapi.lib bufferoverflowU.lib
del loader.obj
popd

cd ..