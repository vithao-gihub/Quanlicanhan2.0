@echo off
setlocal
echo ===================================================
echo   DONG BO CAPACITOR ANDROID (PERSONAL WORKSPACE 2.0)
echo ===================================================
echo [1/2] Dang dong bo tai nguyen vao www/ ...
set ELECTRON_RUN_AS_NODE=1
set CAPACITOR_TELEMETRY=0
set CI=true

".\node_modules\electron\dist\electron.exe" sync-assets.js

echo [2/2] Dang copy tai nguyen moi nhat vao project Android ...
if exist "android\app\src\main\assets\public" (
    attrib -r "android\app\src\main\assets\public\*.*" /s /d >nul 2>&1
    rd /s /q "android\app\src\main\assets\public" >nul 2>&1
)

".\node_modules\electron\dist\electron.exe" ".\node_modules\@capacitor\cli\bin\capacitor" copy android

if %ERRORLEVEL% EQU 0 (
    echo ===================================================
    echo   DONG BO ANDROID THANH CONG!
    echo   Tai nguyen da nam trong: android\app\src\main\assets\public\
    echo ===================================================
) else (
    echo [ERROR] Co loi xay ra trong qua trinh dong bo Android!
)
pause

