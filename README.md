# TUGAS PBP MOBILE - BLUEKICKSPORT

## Created By

- Nama: Vazha Khayri
- NPM: 2406495911
- Kelas: PBP F

## Tech Stack

- Frontend: Flutter

---

<details>
<summary># Tugas 7</summary>

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

</details>

<details>
<summary>Tugas 8</summary>

## 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

`Navigator.push()` menambahkan route baru ke atas stack navigasi, sehingga pengguna dapat kembali ke halaman sebelumnya dengan tombol back. Sementara itu, `Navigator.pushReplacement()` menggantikan route saat ini di stack dengan route baru, sehingga halaman sebelumnya dihapus dan pengguna tidak dapat kembali secara langsung.

Pada aplikasi Football Shop (Bluekicksport), `Navigator.pushReplacement()` digunakan di `LeftDrawer` untuk navigasi ke halaman "Home" atau "Add Product". Ini cocok karena drawer biasanya digunakan untuk berpindah ke bagian utama aplikasi tanpa perlu kembali ke halaman sebelumnya (misalnya, dari form produk kembali ke home). Jika menggunakan `Navigator.push()`, stack akan menumpuk dan pengguna bisa kembali ke halaman yang sama berulang kali, yang tidak efisien untuk navigasi menu utama. Untuk kasus lain seperti membuka detail produk dari list, `Navigator.push()` lebih sesuai agar pengguna bisa kembali ke list.

## 2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

`Scaffold` digunakan sebagai kerangka dasar untuk setiap halaman (`MyHomePage` dan `ProductFormPage`), menyediakan struktur standar dengan `AppBar` di atas, `Drawer` di sisi kiri, dan `body` sebagai area konten utama. `AppBar` menampilkan judul halaman (misalnya, "Bluekicksport" di home dan "Form Tambah Produk" di form) dengan warna latar dari tema aplikasi untuk konsistensi. `Drawer` (`LeftDrawer`) berisi menu navigasi yang sama di semua halaman, memungkinkan akses cepat ke home atau form tanpa mengubah struktur halaman.

Hierarki ini memastikan konsistensi: setiap halaman memiliki header, navigasi samping, dan body yang dapat disesuaikan. Misalnya, di `menu.dart`, `Scaffold` membungkus `AppBar`, `Drawer`, dan `body` dengan `Padding` dan `Column` untuk layout kartu info dan grid item. Di `product_form.dart`, struktur sama digunakan, dengan `body` berisi `Form` dan `SingleChildScrollView` untuk elemen form. Ini membuat aplikasi terasa koheren dan mudah dinavigasi.

## 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` membantu dalam mengatur spacing, scrollability, dan tata letak elemen UI untuk pengalaman pengguna yang lebih baik.

- **Padding**: Menambahkan ruang kosong di sekitar widget untuk mencegah elemen terlalu rapat, meningkatkan readability dan estetika. Kelebihannya adalah fleksibilitas dalam mengontrol margin tanpa mengubah ukuran widget anak.
- **SingleChildScrollView**: Membuat konten scrollable secara vertikal jika tinggi melebihi layar, mencegah overflow dan memungkinkan akses ke semua elemen tanpa cropping. Kelebihannya adalah efisiensi untuk form panjang tanpa perlu list kompleks.
- **ListView**: Ideal untuk menampilkan daftar item yang dapat di-scroll, dengan performa baik untuk data dinamis. Kelebihannya adalah lazy loading dan penghematan memori untuk list besar.

Dalam aplikasi Football Shop, `Padding` digunakan di sekitar setiap `TextFormField` di `product_form.dart` (misalnya, `Padding(padding: const EdgeInsets.all(8.0), child: TextFormField(...))`) untuk memberikan jarak antar field form, membuat form lebih rapi. `SingleChildScrollView` membungkus `Column` di form untuk memungkinkan scrolling jika keyboard muncul atau konten panjang, seperti saat mengisi deskripsi multiline. Meskipun `ListView` tidak digunakan secara eksplisit di kode saat ini, bisa diterapkan untuk menampilkan list produk di masa depan, seperti mengganti `GridView` dengan `ListView` untuk daftar vertikal.

## 4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Warna tema disesuaikan di `main.dart` dalam `MaterialApp` menggunakan `ThemeData` dengan `ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.blueAccent[400])`. Ini menetapkan warna utama biru untuk `AppBar`, tombol, dan elemen interaktif, mencerminkan identitas brand "Football Shop" yang terkait dengan olahraga (biru sering diasosiasikan dengan kepercayaan dan energi).

Konsistensi dicapai dengan menggunakan `Theme.of(context).colorScheme.primary` di `AppBar` dan `DrawerHeader`, serta warna spesifik seperti `Colors.indigo` di form untuk tombol submit. Misalnya, di `menu.dart`, `AppBar` menggunakan `Theme.of(context).colorScheme.primary` untuk warna biru konsisten. Di `product_form.dart`, `AppBar` dan `ElevatedButton` menggunakan `Colors.indigo` untuk variasi yang tetap dalam palet biru. Ini memastikan semua halaman terlihat seragam, memperkuat brand sebagai toko olahraga yang profesional dan energik.

</details>
