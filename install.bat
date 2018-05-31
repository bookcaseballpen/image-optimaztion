REM Turn off displaying actual commands
@echo on
set path=%~dp0
rmdir /s /q  "C:\Image Optimization"
md "C:\Image Optimization"
xcopy "%path:~0,-1%"  "C:\Image Optimization" /e /s /y

reg add "HKEY_CLASSES_ROOT\Directory\shell\Optimize Images\command" /ve /f /d "C:\Image Optimization\optimize.bat \"%%1\"" 
reg add "HKEY_CLASSES_ROOT\*\shell\Optimize Images\command" /ve /f /d "C:\Image Optimization\optimize.bat \"%%1\"" 
pause