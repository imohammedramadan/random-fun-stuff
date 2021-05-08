echo off
set PFL1=C:\Program Files
set PFL2=C:\Program Files (x86)
set /p port=Enter port:
set url=http://localhost:%port%/
set durl=Your URL is %url%
echo %durl%
start "firefox" "%PFL1%\Mozilla Firefox\firefox.exe" %url%
start "firefox dev" "%PFL1%\Firefox Developer Edition\firefox.exe" %url%
@REM if you have 2 different versions of the same browser, make sure to add the path to each of them like firefox above this comment
start "chrome" chrome.exe %url%
start "edge" msedge.exe %url%
start "Internet Explorer" iexplore.exe %url%
start "Opera" opera.exe