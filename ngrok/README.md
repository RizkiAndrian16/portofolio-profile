# Panduan Pengujian & Deployment Sementara Menggunakan Ngrok

Folder ini dirancang khusus untuk mempermudah pengujian website portofolio **Rizki Andrian** secara online melalui koneksi aman (*secure HTTPS tunnel*) menggunakan **Ngrok**, baik untuk pengujian tampilan di *smartphone* (HP), tablet, maupun untuk dibagikan ke recruiter / rekan tim.

---

## 📁 Struktur File dalam Folder `ngrok/`

| File | Fungsi |
| :--- | :--- |
| **`run-menu.bat`** | **Launcher Utama (All-in-One)**: Menampilkan menu interaktif dengan pilihan tunnel Laragon, server standalone, input token, dan monitoring traffic. |
| **`start-laragon-vhost.bat`** | **1-Click Runner Laragon**: Langsung membuka tunnel ke virtual host `profile.test` (Port 80). |
| **`start-standalone.bat`** | **1-Click Runner Mandiri**: Menjalankan web server lokal PHP (`localhost:8080`) sekaligus membuka tunnel ngrok tanpa bergantung pada Apache Laragon. |
| **`ngrok.yml`** | File konfigurasi tunnel siap pakai. |
| **`README.md`** | Panduan lengkap penggunaan dan troubleshooting ini. |

---

## 🚀 Langkah 1: Pengaturan Authtoken (Hanya Dilakukan Sekali)

Ngrok versi 3 mewajibkan authtoken gratis dari akun Ngrok Anda:

1. Buka situs [dashboard.ngrok.com/signup](https://dashboard.ngrok.com/signup) dan buat akun (bisa langsung login dengan akun Google / GitHub).
2. Setelah login, buka menu **Your Authtoken** di sebelah kiri (atau kunjungi [dashboard.ngrok.com/get-started/your-authtoken](https://dashboard.ngrok.com/get-started/your-authtoken)).
3. Salin (*copy*) string token yang muncul (contoh: `2tF...abc123xyz`).
4. Buka file **`run-menu.bat`**, pilih **nomor 4**, lalu *paste* token Anda dan tekan **Enter**.
   *(Atau lewat Command Prompt / Terminal jalankan: `ngrok config add-authtoken TOKEN_ANDA`)*.

---

## 🌐 Langkah 2: Cara Menjalankan Tunnel

Anda dapat memilih salah satu dari 2 metode berikut:

### Opsi A — Melalui Laragon Virtual Host (Rekomendasi jika Laragon aktif)
1. Buka aplikasi **Laragon**, pastikan Anda sudah mengklik tombol **Start All** (Apache aktif).
2. Masuk ke folder `ngrok/`, lalu dobel-klik **`start-laragon-vhost.bat`** (atau pilih opsi 1 di `run-menu.bat`).
3. Ngrok akan menampilkan jendela terminal seperti berikut:
   ```text
   Session Status                online
   Account                       Rizki Andrian (Plan: Free)
   Forwarding                    https://a1b2-c3d4.ngrok-free.app -> http://profile.test:80
   Web Interface                 http://127.0.0.1:4040
   ```
4. Salin tautan pada baris **Forwarding** (contoh: `https://a1b2-c3d4.ngrok-free.app`).

### Opsi B — Server Standalone (Paling Praktis Tanpa Buka Laragon)
1. Cukup dobel-klik **`start-standalone.bat`** (atau pilih opsi 2 di `run-menu.bat`).
2. Script akan otomatis menyalakan PHP server di latar belakang pada `http://127.0.0.1:8080` dan langsung menghubungkannya ke tunnel Ngrok.
3. Salin tautan HTTPS yang muncul.

---

## 📱 Cara Menguji di Smartphone / HP

1. Buka browser di HP Anda (Chrome, Safari, dsb).
2. Ketikkan atau kirim tautan `https://xxxx.ngrok-free.app` ke HP Anda (misal via WhatsApp Web atau kirim email ke diri sendiri).
3. Jika muncul halaman konfirmasi peringatan pertama kali dari Ngrok (*"You are about to visit..."*), cukup klik tombol **Visit Site**.
4. Halaman website portofolio akan langsung tampil dengan sempurna!
   - Coba uji scroll dan navbar.
   - Buka menu dropdown *Let's Connect* dan coba download CV.
   - Buka tombol *Lihat Dokumen Magang* dan *Lihat Sertifikat* untuk memastikan PDF dapat dibaca dengan lancar di layar sentuh HP.

---

## 🔍 Monitoring Traffic & Debugging (Web Interface)

Saat Ngrok sedang aktif, buka browser di laptop Anda ke:
👉 **`http://127.0.0.1:4040`**

Halaman ini adalah **Ngrok Traffic Inspector**:
- Menampilkan semua request HTTP yang masuk secara *real-time* saat website diakses dari HP atau orang luar.
- Menampilkan status kode (`200 OK`, `404 Not Found`, dsb).
- Memungkinkan Anda melihat file CSS, JS, atau gambar apa saja yang di-load dan waktu responsnya.

---

## 🛑 Cara Menghentikan Tunnel

- Pada jendela terminal Ngrok, tekan kombinasi tombol keyboard: **`Ctrl + C`**.
- Jendela akan berhenti dan koneksi tunnel publik langsung ditutup dengan aman.

