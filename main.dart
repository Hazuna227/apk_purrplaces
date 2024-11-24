import 'package:flutter/material.dart'; // Mengimpor paket Material untuk menggunakan widget Flutter
import '/ui/beranda.dart'; // Mengimpor halaman Beranda
import '/helpers/user_info.dart'; // Mengimpor helper untuk mengelola informasi pengguna
import '/ui/halaman_utama.dart';  // Mengimpor HalamanUtama

Future<void> main() async {
  // Memastikan binding Flutter telah diinisialisasi sebelum menjalankan aplikasi
  WidgetsFlutterBinding.ensureInitialized();
  
  // Mengambil token pengguna dari UserInfo
  var token = await UserInfo().getToken();
  print(token); // Menampilkan token di konsol untuk debugging

  // Menjalankan aplikasi dengan MaterialApp
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
    title: "Purrplaces", // Judul aplikasi
    // Menentukan halaman yang akan ditampilkan saat aplikasi dimulai
    home: token == null ? HalamanUtama() : Beranda(), // Jika token null, tampilkan HalamanUtama, jika tidak, tampilkan Beranda
  ));
}
