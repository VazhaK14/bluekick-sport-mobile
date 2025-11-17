# TUGAS PBP MOBILE - BLUEKICKSPORT

## Created By

- Nama: Vazha Khayri
- NPM: 2406495911
- Kelas: PBP F

## Tech Stack

- Frontend: Flutter

---

<details>
<summary>Tugas 7</summary>

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

<details>
<summary>Tugas 9</summary>

## 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Membuat model Dart untuk data JSON sangat penting karena memberikan struktur dan keamanan. Berikut adalah alasannya:

- **Validasi Tipe (Type Safety)**: Model Dart mendefinisikan tipe data yang jelas untuk setiap field (misalnya, `String` untuk nama, `int` untuk jumlah). Ini memungkinkan Dart untuk memvalidasi tipe saat kompilasi dan runtime. Tanpa model, saat menggunakan `Map<String, dynamic>`, kita bisa salah mengakses tipe data (misalnya, mengharapkan `int` tetapi mendapat `String`), yang hanya akan ketahuan saat runtime dan menyebabkan crash.
- **Null-Safety**: Model memungkinkan kita mendefinisikan field mana yang boleh `null` dan mana yang tidak. Ini membantu mencegah `NullPointerException` yang umum terjadi. Jika kita langsung menggunakan `Map`, kita harus secara manual memeriksa apakah setiap kunci ada dan nilainya tidak `null`, yang membuat kode menjadi lebih rumit dan rawan kesalahan.
- **Maintainability**: Model membuat kode lebih mudah dibaca, dipahami, dan dipelihara. Properti diakses dengan `product.name` (jelas dan mudah) daripada `product['name']` (rawan salah ketik dan tidak jelas). Jika struktur data dari API berubah, kita hanya perlu memperbarui model Dart di satu tempat, dan _compiler_ akan menunjukkan semua bagian kode yang perlu disesuaikan. Tanpa model, perubahan seperti ini harus dicari dan diperbaiki secara manual di seluruh aplikasi.

## 2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

- **`http` package**: Ini adalah _package_ dasar untuk melakukan permintaan HTTP di Dart. Fungsinya adalah untuk mengirim permintaan seperti `GET`, `POST`, `PUT`, `DELETE` ke sebuah server dan menerima responsnya. _Package_ ini bersifat umum dan tidak secara otomatis mengelola status sesi atau _cookie_.
- **`CookieRequest`**: Ini adalah kelas dari _package_ `pbp_django_auth` yang merupakan _wrapper_ (pembungkus) dari _package_ `http`. Peran utamanya adalah untuk menyederhanakan komunikasi dengan _backend_ Django yang menggunakan autentikasi berbasis sesi (_cookie_).

**Perbedaan Peran**:

- **`http`** hanya mengirim permintaan dan menerima respons. Setiap permintaan bersifat independen dan tidak menyimpan informasi dari permintaan sebelumnya.
- **`CookieRequest`** secara otomatis menangani _cookie_. Saat melakukan _login_, ia akan menyimpan _cookie_ sesi yang diterima dari Django. Kemudian, untuk setiap permintaan selanjutnya, ia akan secara otomatis melampirkan _cookie_ tersebut, sehingga server mengenali pengguna sebagai _user_ yang sudah _login_. Singkatnya, `CookieRequest` menambahkan fungsionalitas manajemen sesi di atas `http`.

## 3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

_Instance_ `CookieRequest` perlu dibagikan karena di dalamnya tersimpan status autentikasi pengguna, yaitu _cookie_ sesi. Setelah pengguna berhasil _login_, _cookie_ sesi disimpan di dalam _instance_ `CookieRequest` tersebut.

Jika setiap komponen membuat _instance_ `CookieRequest` baru, maka setiap _instance_ akan kosong dan tidak memiliki _cookie_ sesi. Akibatnya, saat komponen tersebut mencoba mengakses _endpoint_ yang memerlukan autentikasi, Django akan menganggapnya sebagai pengguna anonim karena tidak ada _cookie_ yang dikirim.

Dengan membagikan satu _instance_ yang sama (misalnya, menggunakan `Provider`), semua komponen di aplikasi akan menggunakan _instance_ yang sama yang sudah berisi _cookie_ sesi. Ini memastikan bahwa pengguna tetap terautentikasi saat bernavigasi antar halaman atau melakukan aksi yang memerlukan _login_, seperti menambah produk atau melihat data pribadi.

## 4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Agar Flutter dapat berkomunikasi dengan Django yang berjalan di _localhost_, beberapa konfigurasi penting diperlukan:

1.**Menambahkan `10.0.2.2` ke `ALLOWED_HOSTS` di Django**:

    - **Mengapa?**: `10.0.2.2` adalah alamat IP khusus yang digunakan oleh emulator Android untuk merujuk ke `localhost` dari mesin _host_ (komputer tempat Django berjalan). Django secara _default_ hanya mengizinkan koneksi dari `localhost`. Dengan menambahkan `10.0.2.2`, kita memberitahu Django untuk mempercayai permintaan yang datang dari emulator Android.
    - **Jika tidak dilakukan**: Django akan menolak permintaan tersebut dan menghasilkan _error_ "DisallowedHost", sehingga aplikasi Flutter tidak akan bisa terhubung.

2.**Mengaktifkan CORS (`Cross-Origin Resource Sharing`)**:

    - **Mengapa?**: Aplikasi Flutter (berjalan di emulator) dan server Django (berjalan di _localhost_) dianggap berasal dari "origin" yang berbeda. Kebijakan keamanan _browser_ (dan Flutter) memblokir permintaan _cross-origin_ secara _default_. Dengan mengaktifkan CORS di Django (misalnya, dengan `django-cors-headers`), kita memberitahu server untuk mengizinkan permintaan dari origin aplikasi Flutter.
    - **Jika tidak dilakukan**: Permintaan dari Flutter akan diblokir oleh kebijakan CORS, dan kita akan melihat _error_ terkait CORS di _console_ _debug_, yang menyebabkan _request_ gagal.

3.**Pengaturan `SameSite` untuk _Cookie_**:

    - **Mengapa?**: Untuk keamanan, _browser_ modern membatasi pengiriman _cookie_ pada permintaan _cross-site_. Karena Flutter dan Django berjalan di _origin_ yang berbeda, kita perlu mengatur `SESSION_COOKIE_SAMESITE = 'None'` dan `CSRF_COOKIE_SAMESITE = 'None'` di Django. Ini memungkinkan _cookie_ sesi dikirimkan antar _origin_ sehingga autentikasi dapat berfungsi.
    - **Jika tidak dilakukan**: _Cookie_ _login_ tidak akan tersimpan atau tidak akan dikirim pada permintaan selanjutnya. Akibatnya, pengguna tidak akan bisa _login_ atau akan dianggap _logout_ setiap kali melakukan permintaan baru.

4.**Menambahkan Izin Akses Internet di Android**: - **Mengapa?**: Sistem operasi Android memerlukan izin eksplisit dari aplikasi untuk mengakses internet. Izin ini ditambahkan di file `AndroidManifest.xml` dengan baris `<uses-permission android:name="android.permission.INTERNET" />`. - **Jika tidak dilakukan**: Android akan memblokir semua upaya aplikasi untuk membuat koneksi jaringan. Aplikasi tidak akan bisa berkomunikasi dengan server Django sama sekali, dan semua permintaan jaringan akan gagal.

## 5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Mekanisme pengiriman dan penampilan data berjalan dalam beberapa langkah:

1.**Input Pengguna**: Pengguna memasukkan data melalui _widget_ `Form` di Flutter (misalnya, di halaman tambah produk). Data ini ditampung sementara oleh `TextEditingController` pada setiap `TextFormField`. 2.**Validasi dan Pengiriman**: Saat tombol _submit_ ditekan, _form_ divalidasi. Jika valid, sebuah fungsi dipanggil untuk mengirim data. 3.**Membuat Permintaan POST**: Fungsi tersebut menggunakan _instance_ `CookieRequest` untuk membuat permintaan `POST` ke _endpoint_ Django yang sesuai (misalnya, `/create-product-flutter/`). Data dari `TextEditingController` di-encode ke dalam format JSON dan dikirim sebagai _body_ dari permintaan. 4.**Proses di Django**: Django menerima permintaan `POST`, mem-parsing data JSON, memvalidasinya, dan kemudian membuat objek baru di _database_ (misalnya, objek `Product`). 5.**Respons dari Django**: Setelah berhasil menyimpan data, Django mengirimkan respons JSON kembali ke Flutter, biasanya berisi status keberhasilan (misalnya, `{"status": "success"}`). 6.**Menampilkan Data Baru**: Untuk menampilkan data yang baru ditambahkan (dan data lainnya), halaman daftar produk (`ProductEntryListPage`) membuat permintaan `GET` ke _endpoint_ Django yang lain (misalnya, `/json/`). 7.**Menerima dan Mem-parsing Data**: Django merespons permintaan `GET` dengan mengirimkan daftar semua produk dalam format JSON. 8.**Konversi ke Model Dart**: Flutter menerima data JSON ini, mem-parsing-nya, dan mengubah setiap objek JSON menjadi _instance_ dari model Dart (`ProductEntry`). 9.**Menampilkan di UI**: Data yang sudah dalam bentuk objek Dart ini kemudian digunakan untuk membangun _widget_ di UI (misalnya, menggunakan `ListView.builder` untuk menampilkan setiap produk sebagai `Card`), sehingga pengguna dapat melihat data yang baru saja mereka tambahkan.

## 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Mekanisme autentikasi melibatkan alur kerja yang terkoordinasi antara Flutter dan Django:

1.**Registrasi**:

    - **Input di Flutter**: Pengguna mengisi _form_ registrasi di `RegisterPage` (username, password).
    - **Permintaan POST**: Saat _form_ di-_submit_, Flutter mengirimkan permintaan `POST` ke _endpoint_ registrasi Django. Data dikirim dalam format JSON.
    - **Proses di Django**: Django menerima data, memvalidasinya, dan membuat _user_ baru di _database_. Django kemudian mengirimkan respons JSON yang menandakan registrasi berhasil atau gagal.
    - **Hasil di Flutter**: Flutter menampilkan pesan sukses (misalnya, `SnackBar`) dan biasanya mengarahkan pengguna ke halaman _login_.

2.**Login**:

    - **Input di Flutter**: Pengguna memasukkan kredensial di `LoginPage`.
    - **Permintaan POST dengan `CookieRequest`**: Saat _login_, Flutter menggunakan _instance_ `CookieRequest` untuk mengirim permintaan `POST` ke _endpoint_ _login_ Django.
    - **Autentikasi di Django**: Django memeriksa kredensial. Jika valid, Django akan membuat sesi untuk pengguna tersebut dan mengirimkan `sessionid` sebagai _cookie_ dalam _header_ respons.
    - **Penyimpanan Cookie**: `CookieRequest` di Flutter secara otomatis mendeteksi dan menyimpan _cookie_ sesi ini di dalam _instance_-nya.
    - **Navigasi**: Setelah menerima respons sukses dari Django, Flutter menavigasi pengguna ke halaman utama atau menu (`MyHomePage`), dan `Provider` memastikan _instance_ `CookieRequest` yang berisi _cookie_ ini tersedia untuk seluruh aplikasi.

3.**Akses Halaman Terproteksi**:

    - Setiap kali pengguna mencoba mengakses halaman atau fitur yang memerlukan _login_ (misalnya, menambah produk), Flutter akan menggunakan _instance_ `CookieRequest` yang sama untuk membuat permintaan.
    - `CookieRequest` secara otomatis melampirkan `sessionid` yang tersimpan ke dalam _header_ permintaan.
    - Django menerima permintaan, memeriksa `sessionid`, mengidentifikasi pengguna, dan memberikan akses ke data atau fitur yang diminta.

4. **Logout**:
   - **Aksi di Flutter**: Pengguna menekan tombol _logout_.
   - **Permintaan Logout**: Flutter menggunakan `CookieRequest` untuk mengirim permintaan (biasanya `GET` atau `POST`) ke _endpoint_ _logout_ Django.
   - **Proses di Django**: Django menghapus sesi pengguna dari _database_-nya, yang secara efektif membuat `sessionid` yang ada menjadi tidak valid.
   - **Pembersihan di Flutter**: `CookieRequest` akan membersihkan _cookie_ yang tersimpan setelah menerima respons dari Django.
   - **Navigasi**: Flutter mengarahkan pengguna kembali ke `LoginPage`, dan karena _cookie_ sudah tidak ada, pengguna tidak bisa lagi mengakses halaman yang terproteksi.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!

Berikut adalah rincian langkah implementasi dari awal hingga akhir, menggabungkan backend Django dan frontend Flutter.

### Bagian 1: Backend (Django)

**1. Penyiapan Proyek dan Konektivitas**

- Pastikan server Django dapat berjalan dengan `python manage.py runserver`.
- Buka `settings.py` dan lakukan konfigurasi berikut untuk memungkinkan koneksi dari emulator Flutter:

  ```python
  # Izinkan IP emulator Android untuk mengakses server
  ALLOWED_HOSTS = ["10.0.2.2", "localhost"]

  # Konfigurasi CORS untuk mengizinkan permintaan dari origin berbeda
  CORS_ALLOW_ALL_ORIGINS = True
  CORS_ALLOW_CREDENTIALS = True

  # Pengaturan cookie untuk keamanan lintas situs
  CSRF_COOKIE_SECURE = True
  SESSION_COOKIE_SECURE = True
  CSRF_COOKIE_SAMESITE = 'None'
  SESSION_COOKIE_SAMESITE = 'None'
  ```

**2. Membuat Aplikasi Autentikasi**

- Buat aplikasi baru: `python manage.py startapp authentication`.
- Tambahkan `'authentication'` ke `INSTALLED_APPS` di `settings.py`.
- Di `authentication/views.py`, buat view untuk `login`, `register`, dan `logout` yang mengembalikan `JsonResponse`.

  ```python
  # Contoh view register di authentication/views.py
  @csrf_exempt
  def register(request):
      if request.method == 'POST':
          data = json.loads(request.body)
          # ... (logika validasi dan pembuatan user) ...
          if User.objects.filter(username=data['username']).exists():
              return JsonResponse({"status": False, "message": "Username already exists."}, status=400)

          user = User.objects.create_user(username=data['username'], password=data['password1'])
          user.save()
          return JsonResponse({"status": True, "message": "User created successfully!"}, status=201)
      # ...
  ```

- Di `authentication/urls.py`, daftarkan path untuk view tersebut dan `include` path ini di `urls.py` utama proyek.

**3. Melihat Endpoint JSON untuk Produk**

```python
# Mengambil semua produk
def show_json(request):
    product_list = Product.objects.all()
    return HttpResponse(serializers.serialize('json', product_list), content_type='application/json')
```

- Daftarkan view-view ini di `main/urls.py`.

### Bagian 2: Frontend (Flutter)

**4. Instalasi Dependensi**

- Tambahkan package yang dibutuhkan via terminal:
  ```bash
  flutter pub add provider
  flutter pub add pbp_django_auth
  flutter pub add flutter_dotenv
  ```

**5. Konfigurasi Aplikasi Utama**

- Di `main.dart`, atur `Provider` untuk membagikan `CookieRequest` ke seluruh aplikasi dan arahkan `home` ke `LoginPage`.

  ```dart
  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Bluekick Sport',
                theme: ThemeData(/* ... */),
                home: LoginPage(),
            ),
        );
    }
  }
  ```

**6. Membuat Halaman Login dan Registrasi**

- Buat file `screens/login.dart` dan `screens/register.dart`.
- Implementasikan UI dengan `TextFormField` dan `ElevatedButton`.
- Gunakan `request.login()` di `login.dart` dan `request.postJson()` di `register.dart` untuk berkomunikasi dengan endpoint Django.

**7. Membuat Model Produk**

- Buat file `models/product.dart`.
- Definisikan kelas `Product` dengan atribut yang cocok dengan model Django dan buat `factory constructor` untuk parsing JSON.

  ```dart
  class Product {
      // ... atribut seperti name, price, description

      factory Product.fromJson(Map<String, dynamic> json) {
          return Product(
              // ... mapping dari json ke atribut
          );
      }
  }
  ```

**8. Membuat Halaman Daftar Produk (UI)**

- Buat file `screens/product_list.dart`.
- Gunakan `StatefulWidget` dan `FutureBuilder` untuk mengambil data dari endpoint `/json/` Django.
- Di dalam `FutureBuilder`, setelah data berhasil diambil dan di-parse menjadi `List<Product>`, gunakan `ListView.builder` untuk menampilkan setiap produk.
- Setiap item di list bisa berupa `Card` kustom (`widgets/product_card.dart`) yang menampilkan informasi ringkas produk (nama, harga, gambar).

**9. Membuat Halaman Detail Produk**

- Buat file `screens/product_detail.dart`.
- Saat sebuah `Card` produk di `product_list.dart` ditekan, gunakan `Navigator.push` untuk pindah ke halaman detail sambil mengirimkan ID produk.
  ```dart
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(productId: product.pk),
      ),
    );
  }
  ```
- Di `ProductDetailPage`, gunakan ID tersebut untuk mengambil data dari endpoint `/json/<id>/`.
- Tampilkan semua informasi detail produk dan tambahkan tombol kembali.

**10. Implementasi Filter "My Products"**

- Di `widgets/left_drawer.dart`, tambahkan `ListTile` baru untuk "My Products".
- `onTap` pada `ListTile` ini akan menavigasi ke halaman daftar produk, tetapi dengan parameter khusus.
  ```dart
  ListTile(
    title: const Text('My Products'),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductListPage(filter: "user")),
      );
    },
  ),
  ```
- Di `ProductListPage`, modifikasi fungsi `fetchData` untuk memeriksa nilai `widget.filter`. Jika nilainya `"user"`, panggil endpoint `/json/`. Ini memungkinkan satu halaman yang sama digunakan untuk menampilkan data yang berbeda.

</details>
