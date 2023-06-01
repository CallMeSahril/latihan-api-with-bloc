---

# Flutter Bloc Example

Ini adalah contoh proyek Flutter yang menunjukkan penggunaan Bloc, Equatable, HTTP, dan API ReqRes.in untuk mengambil dan menampilkan data pengguna.

Proyek ini menggunakan arsitektur BLoC (Business Logic Component) untuk mengatur logika bisnis dan komunikasi dengan API. Digunakan juga package Equatable untuk mempermudah pembandingan objek, serta package HTTP untuk melakukan permintaan HTTP ke API ReqRes.in.

## Fitur

- Mengambil data pengguna dari API ReqRes.in.
- Menampilkan daftar pengguna.
- Menampilkan detail pengguna.


## Instalasi

1. Clone repositori ini ke mesin lokal Anda:

   ```bash
   git clone https://github.com/CallMeSahril/latihan-api-with-bloc
   ```

2. Masuk ke direktori proyek:

   ```bash
   cd latihan-api-with-bloc
   ```

3. Jalankan perintah berikut untuk menginstal dependensi:

   ```bash
   flutter pub get
   ```

4. Jalankan aplikasi:

   ```bash
   flutter run
   ```

## Penggunaan

1. Buka aplikasi di emulator atau perangkat fisik Anda.
2. Aplikasi akan menampilkan daftar pengguna dari API ReqRes.in.
3. Ketuk salah satu pengguna untuk melihat detailnya.

## Struktur Proyek

- `lib/`
  - `bloc/`: Berisi definisi BLoC, event, dan state.
  - `models/`: Berisi definisi model data.
  - `services/`: Berisi layanan untuk mengambil data dari API.
  - `page/`: Berisi kumpulan page.
  - `widgets/`: Berisi widget yang digunakan dalam tampilan.
  - `main.dart`: Poin masuk aplikasi.

