@echo off
title Minecraft Server with Auto Backup

:: Chạy auto backup trong tiến trình riêng
start "Backup Auto" cmd /c call "%~dp0backup\auto_backup.bat"

:: Chạy Minecraft server
java -Xmx6G -Xms4G -jar server.jar nogui

:: Sau khi server dừng
echo.
echo >>> Đang tắt backup...

for /f "tokens=2" %%i in ('tasklist /v ^| findstr /i "auto_backup.bat"') do (
    taskkill /PID %%i /F
)

pause
