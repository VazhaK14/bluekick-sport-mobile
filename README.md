# TUGAS PBP MOBILE - BLUEKICKSPORT

## Created By

- Nama: Vazha Khayri
- NPM: 2406495911
- Kelas: PBP F

## Tech Stack

- Frontend: Flutter

---

# Tugas 7

## 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Widget tree merupakan struktur hierarkis untuk mendefinisikan UI dalam aplikasi terlihat. Widgets disusun secara hierarkis dan keterhubugan _parent-child_ untuk bertukar informasi. Dapat dianalogikan sebagai sebuah div yang didalamnya terdapat elemen-elemen tertentu.

## 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

### A. Flutter Widget

- MaterialApp: Widget root untuk aplikasi Material Design. Mengelola tema, routing, dan konfigurasi umum aplikasi.
- Scaffold: Menyediakan struktur dasar halaman, termasuk AppBar, body, dan elemen lainnya untuk layout standar.
- AppBar: Menampilkan bar atas halaman dengan judul dan kontrol navigasi.
- Text: Menampilkan teks statis atau dinamis di UI.
- Padding: Menambahkan ruang kosong (padding) di sekitar widget anak.
- Column: Mengatur widget anak dalam tata letak vertikal (kolom).
- Row: Mengatur widget anak dalam tata letak horizontal (baris).
- Card: Membuat kartu dengan elevasi untuk menampilkan konten terpisah.
- Container: Widget fleksibel untuk mengatur ukuran, padding, margin, dan dekorasi widget anak.
- SizedBox: Menambahkan spasi tetap antara widget.
- Center: Memusatkan widget anak di dalam dirinya sendiri.
- GridView.count: Menampilkan widget anak dalam grid dengan jumlah kolom tetap.
- Material: Memberikan efek material design seperti warna latar dan respons sentuh.
- InkWell: Menambahkan respons sentuh (seperti ripple effect) pada widget anak.
- Icon: Menampilkan ikon dari set ikon Flutter.
- SnackBar: Menampilkan pesan sementara di bagian bawah layar sebagai notifikasi.

### B. Created Widget

- MyApp: Widget root aplikasi yang mengonfigurasi MaterialApp dan tema.
- MyHomePage: Widget utama halaman beranda yang mengatur layout dengan Scaffold, AppBar, dan body.
- InfoCard: Widget kartu kustom untuk menampilkan informasi seperti NPM, nama, dan kelas, menggunakan Card dan Container.
- ItemCard: Widget kartu kustom untuk item menu (seperti "All Products"), menggunakan Material, InkWell, dan Icon untuk respons interaktif.

## 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

Material app dapat melakukan konfigurasi pada top-level navigator untuk mencgari route, selain itu juga dapat digunakan untuk mendefinisikan styling untuk menjadi tema utama seperti primary dan secondary color, text, dan lainnya juga sebagai layout utama dari aplikasi.

## 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

- Stateless Widget, digunakan saat membuat komponen yang UI-nya statis dan tidak berubah (ex static text or image, tidak berubah atau melakukan sesuatu saat di klik)

- Stateful wdiget, digunakan saat membuat suatu komponen yang state atau tampilan UI-nya bisa berubah berdasarkan interaksi pengguna atau respon dari API. (ex: widget counter when button clicked)

## 5. Apa itu BuildContext dan Mengapa Penting di Flutter?

Untuk mendefinisikan posisi pada widget di dalam widget tree. Setiap widget memiliki Build Contextnya dan dapat digunakan sebagai

- inherit tema, media query dari root
- Melakukan navigasi atau menampilkan notifikasi
- Membantu Flutter untuk mengoptimalkan rebuild hanya pada bagian tree tertentu. Tidak harus build keseluruhan tree agar lebih efisien.

## 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot Reload adalah fitur yang membuat devleoper dapat melihat perubahan kode secara instan dalam aplikasi tanpa harus restart aplikasi terlebih dahulu.

Perbedaan dengan Hot Restart adalah ketika kita ingin melakukan Hot Reload, tetapi secara menyeluruh pada suatu aplikasi/build ulang aplikasi tersebut. Hal ini dilakukan jika developer melakukan perubahan yang tidak dapat dilakukan dengan hot reload. (ex: perubahan config, perubahan plugin dan lainnya.)
