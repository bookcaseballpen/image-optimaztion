REM Turn off displaying actual commands 
@echo off
echo %1

IF EXIST %1%/ (
    REM @echo %1
    cd %1
    md optmz
    for /r %%i  in (*.jpg) do "C:\Image Optimization\cjpeg.exe" -quality 75 "%%i" > "%%~pi\optmz\%%~ni%%~xi" 
    for /r %%i in (*.png) do "C:\Image Optimization\pngquant.exe" --force --verbose 256 "%%i" -o "%%~pi\optmz\%%~ni%%~xi"

) ELSE (
    IF "%~x1" == ".png" (
        REM @echo I am a PNG
        "C:\Image Optimization\pngquant.exe" --force --verbose 256 "%1"
        REM "C:\Image Optimization\pngout.exe" "%~p1%~n1-fs8%~x1" 
    ) ELSE IF "%~x1" == ".jpg" (
        REM @echo I am a JPEG
        "C:\Image Optimization\cjpeg.exe" -quality 75 "%1" >  "%~p1%~n1-fs8%~x1"  
    )
)
pause