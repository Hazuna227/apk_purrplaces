import 'package:flutter/material.dart'; // Mengimpor paket Flutter untuk antarmuka pengguna.
import '/ui/login.dart'; // Mengimpor halaman Login.
import '/ui/pendaftaran.dart'; // Mengimpor halaman Pendaftaran.

class HalamanUtama extends StatelessWidget { // Kelas HalamanUtama yang merupakan StatelessWidget.
  @override
  Widget build(BuildContext context) { // Fungsi untuk membangun UI.
    return Scaffold( // Menggunakan scaffold untuk struktur halaman.
      backgroundColor: Color(0xFFD2B48C), // Warna latar belakang halaman.
      body: SafeArea( // Menggunakan SafeArea untuk menghindari area yang tidak aman pada perangkat.
        child: Center( // Memusatkan konten di dalam halaman.
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding horizontal.
            child: Column( // Menggunakan kolom untuk menyusun widget secara vertikal.
              mainAxisAlignment: MainAxisAlignment.center, // Memusatkan kolom secara vertikal.
              crossAxisAlignment: CrossAxisAlignment.center, // Memusatkan kolom secara horizontal.
              children: [
                CircleAvatar( // Widget untuk menampilkan gambar bulat.
                  radius: 50, // Jari-jari lingkaran.
                  backgroundImage: AssetImage('assets/Logo PurrPlaces1.jpg'), // Gambar latar belakang.
                  onBackgroundImageError: (error, stackTrace) {
                    // Opsi untuk menangani kesalahan memuat gambar.
                  },
                ),
                SizedBox(height: 20), // Spasi di bawah avatar.
                Text(
                  'PurrPlaces', // Judul aplikasi.
                  style: TextStyle(
                    fontSize: 24, // Ukuran font untuk judul.
                    fontWeight: FontWeight.bold, // Membuat teks tebal.
                    color: Colors.black, // Warna teks.
                  ),
                ),
                SizedBox(height: 50), // Spasi di bawah judul.
                ElevatedButton( // Tombol untuk navigasi ke halaman Login.
                  onPressed: () {
                    Navigator.push( // Navigasi ke halaman Login.
                      context,
                      MaterialPageRoute(
                          builder: (context) => Login()), // Membangun halaman Login.
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Warna latar belakang tombol.
                    foregroundColor: Colors.black, // Warna teks tombol.
                    minimumSize: Size(300, 50), // Ukuran minimum tombol.
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Sudut membulat tombol.
                    ),
                  ),
                  child: Text('Masuk'), // Teks tombol.
                ),
                SizedBox(height: 20), // Spasi di bawah tombol Masuk.
                ElevatedButton( // Tombol untuk navigasi ke halaman Pendaftaran.
                  onPressed: () {
                    Navigator.push( // Navigasi ke halaman Pendaftaran.
                      context,
                      MaterialPageRoute(
                          builder: (context) => Registration()),
                    ); // Membangun halaman Pendaftaran.
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Warna latar belakang tombol.
                    foregroundColor: Colors.black, // Warna teks tombol.
                    minimumSize: Size(300, 50), // Ukuran minimum tombol.
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Sudut membulat tombol.
                    ),
                  ),
                  child: Text('Pendaftaran'), // Teks tombol.
                ),
                SizedBox(height: 30), // Spasi di bawah tombol Pendaftaran.
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0), // Padding horizontal.
                  child: Text(
                    'Dengan Melanjutkan, Berarti Anda Menerima Ketentuan Layanan dan Kebijakan Privasi', // Teks kebijakan.
                    textAlign: TextAlign.center, // Menyelaraskan teks ke tengah.
                    style: TextStyle(
                      color: Colors.black, // Warna teks.
                      fontSize: 12, // Ukuran font untuk teks kebijakan.
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
}
