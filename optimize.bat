REM Turn off displaying actual commands 
@echo none 
REM Move to target directory
cd %1 


REM Cycle through .jpg files and run JpegTran with the optimize, progressive, and copy none options
for /r %%i  in (*.jpg) do "C:\Image Optimization\jpegtran.exe" -optimize -progressive -copy none "%%i" "%%i.lossless" 
REM Remove temporary directory 
for /r %%i  in (*.jpg) do move /y "%%i.lossless" "%%i"

REM Cycle through .jpg files and run JpegTran with the optimize, progressive, and copy none options
for /r %%i  in (*.jpg) do "C:\Image Optimization\cjpeg.exe" -quality 75 "%%i" > "%%i.lossy" 
REM Remove temporary directory 
for /r %%i  in (*.jpg) do move /y "%%i.lossy" "%%i"

REM Cycle through .png files and run PngOut with default settings overwriting originals 
for /r %%i in (*.png) do "C:\Image Optimization\pngout.exe" "%%i" 
for /r %%i in (*.png) do "C:\Image Optimization\pngquant.exe" --force --verbose 256 "%%i" --ext "%%i" 

REM add in pause here to keep the command prompt open if you're debugging 