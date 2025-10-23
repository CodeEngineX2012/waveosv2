@echo off
title Wave Server Manager - wpm

:startup
cls
echo Wave Live Session [Version 1.5.2025]
echo (c) WaveOS. All rights reserved
echo Wave Server Manager

:loop
set "matched=false"
set /p user_input=[wave@wpm ~]$ 

if "%user_input%"=="help" (
    set matched=true
    echo Available commands:
    echo   help     : Show this help menu
    echo   ls       : List current directory
    echo   clear    : Clear the screen
    echo   exit     : Exit the wpm Live Session
)


if "%user_input%"=="clear" (
    set matched=true
    cls
)

if "%user_input%"=="ls" (
    set matched=true
    dir /b
)

if "%user_input%"=="slash fetch server" (
    set matched=true
    echo server_name : wave.live
    echo server_source : https://codeenginex.wuaze.com/waveos/server.html
    echo server_password : iloveyou@wave
)

if "%user_input%"=="exit" (
    exit
)

if "%matched%"=="false" (
    echo Command Not Found
)

goto loop