@echo off

@REM Checking if youtube-dl is installed
if not exist youtube-dl.exe GOTO YTDL
@REM Checking if youtube-dl is installed

@REM Checking if FFMPEG is installed
move ffmpeg*build ffmpeg
if not exist ffmpeg\bin\ffmpeg.exe GOTO NOFFMPEGEND
@REM Checking if FFMPEG is installed

@REM Variables
set MKVOutput=--merge-output-format mkv
set MP4Output=--merge-output-format mp4
set FFMPEGLOC=--ffmpeg-location ffmpeg\bin\ffmpeg.exe
@REM Variables

@REM Program start
:PROGRAMSTART
@REM Vidoe URL input
set /P VideoURL=Enter video URL: 
@REM Vidoe URL input

@REM Audio or Video Choice
SET /P AudioOrVideo=Do you want to download audio only (A) or video (V)?
IF /I %AudioOrVideo% EQU A ( GOTO AUDIOONLY ) else ( GOTO AUDIOANDVIDEO )
@REM Audio or Video Choice

@REM Audio only download
:AUDIOONLY
youtube-dl -f 140 %VideoURL%
GOTO END
@REM Audio only download

@REM FHD/1080p or HD/720p choice
:AUDIOANDVIDEO
SET /P HDorFHD= Do you want to download HD/720p or FHD/1080p? [HD/FHD]
IF /I %HDorFHD% EQU HD ( GOTO VIDEOHD ) else ( GOTO VIDEOFHD )
@REM FHD/1080p or HD/720p choice

@REM Donwload in HD/720p
:VIDEOHD
youtube-dl %FFMPEGLOC% -f 247+bestaudio/140 %MKVOutput% %VideoURL%
GOTO END
@REM Donwload in HD/720p

@REM Donwload in FHD/1080p
:VIDEOFHD
youtube-dl %FFMPEGLOC% -f 248+bestaudio/140 %MKVOutput% %VideoURL%
@REM https://www.youtube.com/watch?v=ZREP2KoiWYA
GOTO END
@REM Donwload in FHD/1080p

@REM ending messeage when youtube-dl is not installed
:YTDL
echo *********************************************************
echo *              Please download youtube-dl               *
echo * Your default browser will launch to the download link *
echo *********************************************************
Pause
start https://ytdl-org.github.io/youtube-dl/index.html
GOTO NOFFMPEGEND
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