@echo off
setlocal
REM flags to help catch linux build problems
set VSCXXFLAGS=-DCMAKE_CXX_FLAGS="/DWIN32 /D_WINDOWS /W3 /Zm1000 /GR /EHsc /wd4619 /wd4820 /we4289 /wd4342 /wd4347 /wd4514 /we4545 /we4546 /we4547 /w34548 /we4549 /we4619 /we4623"
REM -DCMAKE_VERBOSE_MAKEFILE=ON
SET PARAMS=-G "Visual Studio 10 Win64" -DCPPCHECK_EXECUTABLE=""  %VSCXXFLAGS% %*
echo cmake %PARAMS%
cmake %PARAMS%
choice /D y /M y /n /t 1
echo 
echo 
echo 
echo 
choice /D y /M y /n  /t 1
date /t
time /t
