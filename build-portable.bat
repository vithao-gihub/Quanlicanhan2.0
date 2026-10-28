@echo off
setlocal
echo ===================================================
echo   DONG GOI PERSONAL WORKSPACE 2.0 (WINDOWS PORTABLE)
echo ===================================================
echo [1/2] Dang dong bo tai nguyen vao www/ ...
set ELECTRON_RUN_AS_NODE=1
".\node_modules\electron\dist\electron.exe" sync-assets.js

echo [2/2] Dang dong goi file Portable chay ngay (.exe) ...
".\node_modules\electron\dist\electron.exe" -e "process.noAsar = true; const builder = require('electron-builder'); builder.build({ targets: builder.Platform.WINDOWS.createTarget(['portable'], builder.Arch.x64) }).then(res => { console.log('Build Portable thanh cong: ' + res); }).catch(err => { console.error('Loi:', err); process.exit(1); });"

if %ERRORLEVEL% EQU 0 (
    echo ===================================================
    echo   DONG GOI THANH CONG!
    echo   File Portable dat tai: dist-electron\Quan-Li-Ca-Nhan-2.0-Portable.exe
    echo ===================================================
) else (
    echo [ERROR] Co loi xay ra trong qua trinh dong goi!
)
pause

