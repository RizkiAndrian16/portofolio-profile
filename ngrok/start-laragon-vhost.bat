@echo off
title Ngrok - Laragon Virtual Host (profile.test)
color 0B
cd /d "%~dp0.."

echo ======================================================================
echo    NGROK TUNNEL: LARAGON VIRTUAL HOST (profile.test)
echo ======================================================================
echo.
echo Pastikan Apache di Laragon sudah berjalan ("Start All").
echo Menghubungkan tunnel ke http://profile.test (Port 80)...
echo.
echo Salin link Forwarding (https://xxxx.ngrok-free.app) untuk testing di HP!
echo Tekan Ctrl + C untuk berhenti.
echo.

ngrok http 80 --host-header="profile.test" --config "%~dp0ngrok.yml"
pause
