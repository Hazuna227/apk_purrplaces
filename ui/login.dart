import 'package:flutter/material.dart'; // Mengimpor paket Flutter untuk antarmuka pengguna.
import 'beranda.dart'; // Mengimpor halaman Beranda.
import 'package:purrplaces/service/login_service.dart'; // Mengimpor layanan login.

class Login extends StatefulWidget { // Kelas Login yang merupakan StatefulWidget.
  const Login({Key? key}) : super(key: key); // Konstruktor untuk Login.
  _LoginState createState() => _LoginState(); // Membuat instance dari _LoginState.
}

class _LoginState extends State<Login> { // Kelas state untuk Login.
  final _formKey = GlobalKey<FormState>(); // Kunci untuk form.
  final _emailCtrl = TextEditingController(); // Kontrol untuk field email.
  final _passwordCtrl = TextEditingController(); // Kontrol untuk field password.

  @override
  Widget build(BuildContext context) { // Fungsi untuk membangun UI.
    return Scaffold( // Menggunakan scaffold untuk struktur halaman.
      appBar: AppBar(
        automaticallyImplyLeading: true, // Mengizinkan tombol kembali.
        title: const Text("Masuk"), // Judul aplikasi.
        centerTitle: true, // Memusatkan judul.
      ),
      body: SingleChildScrollView( // Mengizinkan scroll untuk konten yang lebih tinggi dari layar.
        child: SafeArea( // Menggunakan SafeArea untuk menghindari area yang tidak aman pada perangkat.
          child: Container(
            height: MediaQuery.of(context).size.height, // Mengambil tinggi layar.
            padding: EdgeInsets.only(top: 50), // Menambah jarak dari atas.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Menyusun elemen ke atas.
              children: [
                Center(
                  child: Form(
                    key: _formKey, // Menghubungkan form dengan kunci.
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3, // Lebar kontainer form.
                      child: Column(
                        children: [
                          _usernameTextField(), // Field untuk email.
                          SizedBox(height: 20), // Spasi antara field.
                          _passwordTextField(), // Field untuk password.
                          SizedBox(height: 40), // Spasi antara field dan tombol.
                          _tombolLogin(), // Tombol login.
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk field email
  Widget _usernameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email", // Label untuk field.
        prefixIcon: Icon(Icons.mail, color: Colors.black), // Ikon di sebelah kiri field.
        filled: true, // Mengisi warna latar belakang.
        fillColor: Colors.grey[200], // Warna latar belakang field.
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Membulatkan sudut field.
          borderSide: BorderSide.none, // Menghilangkan garis batas.
        ),
      ),
      controller: _emailCtrl, // Menghubungkan kontrol dengan field.
    );
  }

  // Widget untuk field password
  Widget _passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Kata Sandi", // Label untuk field.
        prefixIcon: Icon(Icons.lock, color: Colors.black), // Ikon di sebelah kiri field.
        filled: true, // Mengisi warna latar belakang.
        fillColor: Colors.grey[200], // Warna latar belakang field.
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Membulatkan sudut field.
          borderSide: BorderSide.none, // Menghilangkan garis batas.
        ),
      ),
      obscureText: true, // Menyembunyikan teks password.
      controller: _passwordCtrl, // Menghubungkan kontrol dengan field.
    );
  }

  // Widget untuk tombol login
  Widget _tombolLogin() {
    return Container(
      width: MediaQuery.of(context).size.width, // Mengambil lebar layar.
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD2B48C), // Warna latar belakang tombol.
          padding: EdgeInsets.symmetric(vertical: 15), // Padding vertikal tombol.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Membulatkan sudut tombol.
          ),
        ),
        child: const Text("Masuk", style: TextStyle(color: Colors.black)), // Teks tombol.
        onPressed: () async { // Fungsi saat tombol ditekan.
          String email = _emailCtrl.text; // Mengambil email dari kontrol.
          String password = _passwordCtrl.text; // Mengambil password dari kontrol.
          await LoginService().login(email, password).then((value) { // Memanggil layanan login.
            if (value == true) { // Jika login berhasil.
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Beranda()), // Navigasi ke halaman Beranda.
              );
            } else { // Jika login gagal.
              AlertDialog alertDialog = AlertDialog(
                content: const Text("Email atau Password Tidak Valid"), // Pesan kesalahan.
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Menutup dialog.
                    },
                    child: const Text("OK"),
                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 240, 94, 94)), // Gaya tombol.
                  ),
                ],
              );
              showDialog(
                context: context,
                builder: (context) => alertDialog, // Menampilkan dialog kesalahan.
              );
            }
          });
        },
      ),
    );
  }
}
