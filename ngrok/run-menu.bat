@echo off
setlocal enabledelayedexpansion
title Ngrok Testing Launcher - Portofolio Rizki Andrian
color 0A

:: Berpindah ke root folder profile
cd /d "%~dp0.."

:MENU
cls
echo ===============================================================================
echo               NGROK TESTING LAUNCHER - PORTOFOLIO RIZKI ANDRIAN
echo ===============================================================================
echo.
echo   Folder Kerja : %CD%
echo   Status Token : Authtoken Sudah Terpasang di ngrok.yml
echo.
echo   [1] Jalankan Ngrok via Laragon Virtual Host (profile.test - Port 80) [REKOMENDASI]
echo   [2] Jalankan Ngrok via Standalone Server (PHP Port 8080) [Otomatis & Praktis]
echo   [3] Jalankan Ngrok via Laragon Localhost (Port 80)
echo   [4] Update / Ubah Authtoken Ngrok
echo   [5] Buka Web Traffic Inspector Ngrok (http://127.0.0.1:4040)
echo   [6] Keluar
echo.
echo ===============================================================================
set /p choice="Pilih nomor opsi [1-6]: "

if "%choice%"=="1" goto OPTION1
if "%choice%"=="2" goto OPTION2
if "%choice%"=="3" goto OPTION3
if "%choice%"=="4" goto OPTION4
if "%choice%"=="5" goto OPTION5
if "%choice%"=="6" goto EXIT_SCRIPT

echo.
echo Pilihan tidak valid! Silakan masukkan angka 1 sampai 6.
timeout /t 2 >nul
goto MENU

:OPTION1
cls
echo ===============================================================================
echo      MENJALANKAN NGROK KE LARAGON VIRTUAL HOST (profile.test)
echo ===============================================================================
echo.
echo Pastikan Apache di Laragon sudah di-klik "Start All"!
echo Host Header: profile.test
echo Port        : 80
echo.
echo Tekan Ctrl + C di jendela ini kapan saja untuk menghentikan tunnel.
echo.
ngrok http 80 --host-header="profile.test" --config "%~dp0ngrok.yml"
pause
goto MENU

:OPTION2
cls
echo ===============================================================================
echo      MENJALANKAN STANDALONE PHP SERVER (PORT 8080) + NGROK TUNNEL
echo ===============================================================================
echo.
echo 1. Menjalankan PHP Built-in Server di latar belakang (Port 8080)...
start "PHP Web Server - Portofolio" cmd /k "title PHP Web Server && cd /d "%CD%" && echo Server aktif di http://127.0.0.1:8080 && echo Jangan tutup jendela ini selama testing berlangsung. && php -S 127.0.0.1:8080"
timeout /t 2 >nul

echo 2. Menghubungkan Ngrok Tunnel ke http://127.0.0.1:8080 ...
echo.
echo Bagikan link publik HTTPS dari ngrok ke HP atau rekan untuk testing.
echo Tekan Ctrl + C untuk menghentikan tunnel ngrok.
echo.
ngrok http 8080 --config "%~dp0ngrok.yml"
pause
goto MENU

:OPTION3
cls
echo ===============================================================================
echo      MENJALANKAN NGROK KE LARAGON LOCALHOST (PORT 80)
echo ===============================================================================
echo.
echo Pastikan Apache di Laragon sudah di-klik "Start All"!
echo.
echo Catatan: Jika diakses, URL akan mengarah ke http://localhost/profile/
echo.
ngrok http 80 --host-header=rewrite --config "%~dp0ngrok.yml"
pause
goto MENU

:OPTION4
cls
echo ===============================================================================
echo                       UPDATE NGROK AUTHTOKEN
echo ===============================================================================
echo.
echo Token Anda saat ini tersimpan di: ngrok\ngrok.yml
echo.
set /p user_token="Masukkan token baru (lalu tekan Enter): "
if "%user_token%"=="" (
    echo Token tidak boleh kosong.
    timeout /t 2 >nul
    goto MENU
)
powershell -Command "(Get-Content '%~dp0ngrok.yml') -replace '^authtoken:.*', 'authtoken: %user_token%' | Set-Content '%~dp0ngrok.yml'"
echo.
echo ===============================================================================
echo Authtoken berhasil diperbarui di ngrok\ngrok.yml!
echo ===============================================================================
pause
goto MENU

:OPTION5
start http://127.0.0.1:4040
goto MENU

:EXIT_SCRIPT
exit /b
