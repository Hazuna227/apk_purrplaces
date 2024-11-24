import 'package:flutter/material.dart';
import 'package:purrplaces/ui/profil_page.dart'; // Mengimpor halaman Profil
import '../ui/beranda.dart'; // Mengimpor halaman Beranda
import '/ui/halaman_utama.dart'; // Mengimpor halaman Utama
import '/ui/toko_product.dart'; // Mengimpor halaman Produk

// Widget Sidebar yang akan menampilkan navigasi dalam bentuk Drawer
class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Menghapus padding default
        children: [
          // Header akun pengguna di sidebar
          UserAccountsDrawerHeader(
            accountName: Text("Andreas"), // Nama pengguna
            accountEmail: Text("Siapaaku@admin.com"), // Email pengguna
            decoration: BoxDecoration(
              color: const Color(0xFFD2B48C), // Warna latar belakang header
            ),
          ),
          // Item untuk navigasi ke halaman Beranda
          ListTile(
            leading: Icon(Icons.home), // Ikon untuk Beranda
            title: Text("Beranda"), // Judul untuk item
            onTap: () {
              // Navigasi ke halaman Beranda saat item ditekan
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          // Item untuk navigasi ke halaman Produk
          ListTile(
            leading: Icon(Icons.shopping_bag), // Ikon untuk Produk
            title: Text("Produk"), // Judul untuk item
            onTap: () {
              // Navigasi ke halaman Produk saat item ditekan
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TokoList()));
            },
          ),
          // Item untuk navigasi ke halaman Profil
          ListTile(
            leading: Icon(Icons.person), // Ikon untuk Profil
            title: Text("Profil"), // Judul untuk item
            onTap: () {
              // Navigasi ke halaman Profil saat item ditekan
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          // Item untuk keluar dari aplikasi
          ListTile(
            leading: Icon(Icons.logout_rounded), // Ikon untuk Logout
            title: Text("Keluar"), // Judul untuk item
            onTap: () {
              // Navigasi ke halaman Utama dan menghapus semua rute sebelumnya
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HalamanUtama()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
