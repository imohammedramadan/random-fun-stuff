@echo off
SETLOCAL EnableDelayedExpansion

@REM Create Downloads folder
if not exist Downloads mkdir Downloads
@REM Create Downloads folder

@REM Checking if youtube-dl is installed
if not exist youtube-dl.exe GOTO YTDL
@REM Checking if youtube-dl is installed

:FFMPEG
@REM Checking if FFMPEG is installed
if not exist ffmpeg\bin\ffmpeg.exe move ffmpeg*build ffmpeg
if not exist ffmpeg\bin\ffmpeg.exe GOTO NOFFMPEGEND
@REM Checking if FFMPEG is installed

@REM Program start
:PROGRAMSTART
@REM Vidoe URL input
set /P VideoURL=* Please enter a video link: 
@REM Vidoe URL input

@REM Audio or Video Choice
SET /P AudioOrVideo=* Do you want to download audio only (A) or video (V)?
IF /I %AudioOrVideo% EQU A ( GOTO AUDIOONLY ) else ( GOTO AUDIOANDVIDEO )
@REM Audio or Video Choice

@REM Audio only download
:AUDIOONLY
@REM loading the config file
set CONFIGLOC=--config-location Config\audio-config.ini
@REM loading the config file
youtube-dl %CONFIGLOC% %VideoURL%
GOTO END
@REM Audio only download

@REM FHD/1080p or HD/720p choice
:AUDIOANDVIDEO
SET /P HDorFHD=* Do you want to download HD/720p or FHD/1080p? [HD/FHD]
IF /I %HDorFHD% EQU HD ( GOTO VIDEOHD ) else ( GOTO VIDEOFHD )
@REM FHD/1080p or HD/720p choice

@REM Download in HD/720p
:VIDEOHD
@REM loading the config file
set CONFIGLOC=--config-location Config\video-hd-config.ini
@REM loading the config file
youtube-dl %CONFIGLOC% %VideoURL%
GOTO END
@REM Download in HD/720p

@REM Download in FHD/1080p
:VIDEOFHD
@REM loading the config file
set CONFIGLOC=--config-location Config\video-fhd-config.ini
@REM loading the config file
youtube-dl %CONFIGLOC% %VideoURL%
GOTO END
@REM Download in FHD/1080p

@REM ending messeage when youtube-dl is not installed
:YTDL
echo *********************************************************
echo *              Please download youtube-dl               *
echo * Your default browser will launch to the download link *
echo *********************************************************
Pause
start https://ytdl-org.github.io/youtube-dl/index.html
GOTO FFMPEG
@REM ending messeage when youtube-dl is not installed

@REM ending messeage when FFPMEG is NOT installed
:NOFFMPEGEND
echo ****************************************************************************
echo * Please download and extract ffmpeg in the current folder and start again *
echo *          Your default browser will launch to the download link           *
echo ****************************************************************************
Pause
start https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z
GOTO PROGRAMEXIT
@REM ending messeage when FFPMEG is NOT installed

@REM Start again or exit the program
:END
SET /P ExitOrStart=Do you want to download another video? [Y/N]
IF /I %ExitOrStart% EQU Y ( GOTO PROGRAMSTART ) else ( GOTO PROGRAMEXIT )
@REM Start again or exit the program

:PROGRAMEXIT
echo Thank you!
timeout 2
@REM Program end