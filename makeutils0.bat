@echo off

mkdir bin 2>nul
call config.bat
set lib=%ddkdir%\lib

cd src

pushd .
call %ddkdir%\bin\setenv.bat %ddkdir% WXP
popd

pushd .
cd util
rc winvblock.rc
cl /I%CRT_INC_PATH% /I..\include /DWIN32_LEAN_AND_MEAN winvblk.c winvblock.res /Fe..\..\bin\winvblk.exe /link /LIBPATH:%DDK_LIB_DEST%\i386 /LIBPATH:%Lib%\crt\i386 bufferoverflowU.lib advapi32.lib
del winvblk.obj
popd

pushd .
cd httpdisk_util
build
copy /y obj%obj%\%arch%\httpdisk.exe ..\..\bin
popd

pushd .
cd loader
cl /I%CRT_INC_PATH% /I..\include /DWIN32_LEAN_AND_MEAN loader.c /Fe..\..\bin\loader32.exe /link /LIBPATH:%DDK_LIB_DEST%\i386 /LIBPATH:%Lib%\crt\i386 setupapi.lib bufferoverflowU.lib
del loader.obj
popd


cd ..