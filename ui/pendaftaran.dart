import 'package:flutter/material.dart'; // Mengimpor paket Flutter untuk antarmuka pengguna.

class Registration extends StatefulWidget { // Kelas Registration sebagai StatefulWidget.
  const Registration({Key? key}) : super(key: key); // Konstruktor untuk Registration.
  
  @override
  _RegistrationState createState() => _RegistrationState(); // Membuat instance dari _RegistrationState.
}

class _RegistrationState extends State<Registration> { // Kelas state untuk Registration.
  final _formKey = GlobalKey<FormState>(); // Kunci untuk form, digunakan untuk validasi.
  final _nameCtrl = TextEditingController(); // Kontrol untuk field nama.
  final _emailCtrl = TextEditingController(); // Kontrol untuk field email.
  final _passwordCtrl = TextEditingController(); // Kontrol untuk field kata sandi.

  @override
  Widget build(BuildContext context) { // Fungsi untuk membangun UI.
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // Menampilkan tombol kembali.
        title: const Text("Pendaftaran"), // Judul halaman pendaftaran.
        centerTitle: true, // Memusatkan judul.
      ),
      body: SingleChildScrollView( // Scrollable view untuk konten.
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height, // Mengatur tinggi container sesuai dengan tinggi layar.
            padding: const EdgeInsets.only(top: 50), // Menambahkan ruang dari atas.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Form(
                    key: _formKey, // Mengaitkan form dengan kunci.
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3, // Lebar container sesuai ukuran layar.
                      child: Column(
                        children: [
                          _nameTextField(), // Memanggil widget untuk field nama.
                          const SizedBox(height: 20), // Spasi antar field.
                          _emailTextField(), // Memanggil widget untuk field email.
                          const SizedBox(height: 20), // Spasi antar field.
                          _passwordTextField(), // Memanggil widget untuk field kata sandi.
                          const SizedBox(height: 40), // Spasi sebelum tombol daftar.
                          _registerButton(), // Memanggil widget untuk tombol daftar.
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

  Widget _nameTextField() { // Widget untuk field nama.
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Nama Lengkap", // Label untuk field.
        prefixIcon: Icon(Icons.person, color: Colors.black), // Ikon untuk field.
        filled: true, // Mengisi latar belakang field.
        fillColor: Colors.grey[200], // Warna latar belakang field.
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Membulatkan sudut field.
          borderSide: BorderSide.none, // Tanpa garis tepi.
        ),
      ),
      controller: _nameCtrl, // Menghubungkan field dengan kontroler nama.
    );
  }

  Widget _emailTextField() { // Widget untuk field email.
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email", // Label untuk field.
        prefixIcon: Icon(Icons.mail, color: Colors.black), // Ikon untuk field.
        filled: true, // Mengisi latar belakang field.
        fillColor: Colors.grey[200], // Warna latar belakang field.
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Membulatkan sudut field.
          borderSide: BorderSide.none, // Tanpa garis tepi.
        ),
      ),
      controller: _emailCtrl, // Menghubungkan field dengan kontroler email.
    );
  }

  Widget _passwordTextField() { // Widget untuk field kata sandi.
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Kata Sandi", // Label untuk field.
        prefixIcon: Icon(Icons.lock, color: Colors.black), // Ikon untuk field.
        filled: true, // Mengisi latar belakang field.
        fillColor: Colors.grey[200], // Warna latar belakang field.
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Membulatkan sudut field.
          borderSide: BorderSide.none, // Tanpa garis tepi.
        ),
      ),
      obscureText: true, // Menyembunyikan teks yang diketik (kata sandi).
      controller: _passwordCtrl, // Menghubungkan field dengan kontroler kata sandi.
    );
  }

  Widget _registerButton() { // Widget untuk tombol daftar.
    return Container(
      width: MediaQuery.of(context).size.width, // Lebar tombol sesuai ukuran layar.
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD2B48C), // Warna latar belakang tombol.
          padding: const EdgeInsets.symmetric(vertical: 15), // Padding vertikal.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Membulatkan sudut tombol.
          ),
        ),
        child: const Text("Daftar", style: TextStyle(color: Colors.black)), // Teks tombol.
        onPressed: () {
          // Logika pendaftaran akan ditambahkan di sini.
        },
      ),
    );
  }
}
