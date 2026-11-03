@echo off
title Ngrok - Standalone PHP Server + Tunnel
color 0E
cd /d "%~dp0.."

echo ======================================================================
echo    STANDALONE PHP SERVER + NGROK TUNNEL (PORT 8080)
echo ======================================================================
echo.
echo Menjalankan local server dan ngrok tunnel tanpa perlu membuka Laragon...
echo.

:: Jalankan PHP Built-in Server di jendela terpisah
start "PHP Web Server (Port 8080)" cmd /k "title PHP Web Server && cd /d "%CD%" && echo Server aktif di http://127.0.0.1:8080 && echo Biarkan jendela ini tetap terbuka selama testing. && php -S 127.0.0.1:8080"
timeout /t 2 >nul

:: Jalankan tunnel Ngrok
echo Menghubungkan Ngrok ke http://127.0.0.1:8080 ...
echo.
echo Salin link Forwarding (https://xxxx.ngrok-free.app) untuk testing di HP!
echo Tekan Ctrl + C untuk berhenti.
echo.

ngrok http 8080 --config "%~dp0ngrok.yml"
pause
