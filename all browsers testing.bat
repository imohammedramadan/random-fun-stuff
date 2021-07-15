@echo off
SETLOCAL EnableDelayedExpansion
set PFiles64=C:\Program Files
set PFiles86=C:\Program Files (x86)
:PROMPT
    SET /P useDefaultPort= Do you want to use the default port (5000)? [Y/N]
    IF /I %useDefaultPort% EQU Y ( GOTO RUNBROWSERSDEFAULT ) else ( GOTO ENTERPORT )
:ENTERPORT
    set /P port=Enter port:
    set targetUrl=http://localhost:%port%/
    GOTO RUNBROSWERS
:RUNBROWSERSDEFAULT
    set targetUrl=http://localhost:5000/
:RUNBROSWERS
    echo %targetUrl%
    start "Chrome" "%PFiles64%\Google\Chrome\Application\chrome.exe" %targetUrl%
        Echo Chrome Started
    @REM start "Firefox" "%PFiles64%\Mozilla Firefox\firefox.exe" %url%
        @REM Echo Firefox Started
    @REM start "Edge" msedge.exe %url%
        @REM Echo Edge Started
    @REM start "Chrome dev" chrome.exe %url%
        @REM Echo Chrome dev Started
    @REM start "Firefox dev" "%PFiles64%\Firefox Developer Edition\firefox.exe" %url%
        @REM Echo Firefox dev Started
    @REM if you have 2 different versions of the same browser, make sure to add the path to each of them like firefox above this comment
    @REM start "Internet Explorer" iexplore.exe %url%
        @REM Echo Internet Explorer Started
    @REM start "Opera" opera.exe
        @REM Echo Opera Started
Pause