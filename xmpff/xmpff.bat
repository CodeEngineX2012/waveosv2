@echo off
title Wave Text Processor

:startup
cls
echo Wave Live Session [Version 2.0.2025]
echo (c) WaveOS. All rights reserved
echo xmpff [Version 2.1.2024]

:loop
set "matched=false"
set /p user_input=[wave@xmpff ~]$ 

if "%user_input%"=="help" (
    set matched=true
    echo Available commands:
    echo   help     : Show this help menu
    echo   xmpff    : Run a different version of WaveOS V2
    echo   ip add   : Show local IP address
    echo   ls       : List current directory
    echo   clear    : Clear the screen
    echo   whoami   : Show current user
    echo   uname    : Show system name
    echo   exit     : Exit the xmpff Session
)

if "%user_input%"=="xm --xpm" (
    set matched=true
    call xpm.bat
)

if "%user_input%"=="ip add" (
    set matched=true
    echo Fetching local IP address...
    for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /i "IPv4"') do echo IP Address:%%A
)

if "%user_input%"=="whoami" (
    set matched=true
    echo %USERNAME%
)

if "%user_input%"=="clear" (
    set matched=true
    cls
)

if "%user_input%"=="ls" (
    set matched=true
    dir /b
)

if "%user_input%"=="exit" (
    exit
)

if "%matched%"=="false" (
    echo Command Not Found
)

goto loop