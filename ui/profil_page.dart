import 'package:flutter/material.dart';
import 'package:purrplaces/ui/toko_product.dart'; // Mengimpor halaman Toko Produk
import 'beranda.dart'; // Mengimpor halaman Beranda

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 2; // Menandakan bahwa halaman Profil yang aktif

  // Fungsi untuk menangani saat item di bottom navigation bar dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Memperbarui indeks yang dipilih
    });
    switch (index) {
      case 0:
        // Navigasi ke halaman Beranda
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Beranda()),
        );
        break;
      case 1:
        // Navigasi ke halaman Toko Produk
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TokoList()),
        );
        break;
      case 2:
        // Tetap di halaman Profil
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'), // Judul halaman Profil
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Foto profil dan nama
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    CircleAvatar(
                      radius: 50, // Ukuran foto profil
                      backgroundColor: Colors.black12, // Warna latar belakang
                      child: Icon(
                        Icons.person, // Ikon untuk foto profil
                        size: 80, // Ukuran ikon
                        color: Colors.black54, // Warna ikon
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Andreas', // Nama pengguna
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),

              // Informasi Alamat
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Alamat', // Label untuk alamat
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity, // Lebar penuh layar
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFFD2B48C), // Warna latar belakang kotak alamat
                        borderRadius: BorderRadius.circular(8), // Sudut melengkung
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1), // Bayangan
                            offset: Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Text(
                        'SEPAKAT 2, KOMPLEK BUMI SEPAKAT PERMAI, NO 8C', // Alamat pengguna
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Informasi Nomor Telepon
                    const Text(
                      'No Telepon', // Label untuk nomor telepon
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity, // Lebar penuh layar
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFFD2B48C), // Warna latar belakang kotak nomor telepon
                        borderRadius: BorderRadius.circular(8), // Sudut melengkung
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1), // Bayangan
                            offset: Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Text(
                        '085822244956', // Nomor telepon pengguna
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          // Tombol Log Out di kanan bawah
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.logout, // Ikon untuk tombol Log Out
                      size: 30,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      // Logika untuk Log Out
                    },
                  ),
                  const Text(
                    'Log Out', // Teks untuk tombol Log Out
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Tipe BottomNavigationBar yang tetap
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk Beranda
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag), // Ikon untuk Produk
            label: "Produk",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ikon untuk Profil
            label: "Profil",
          ),
        ],
        currentIndex: _selectedIndex, // Indeks yang saat ini dipilih
        selectedItemColor: Colors.black, // Warna untuk item yang dipilih
        unselectedItemColor: Colors.grey, // Warna untuk item yang tidak dipilih
        onTap: _onItemTapped, // Fungsi yang dipanggil saat item ditekan
      ),
    );
  }
}
