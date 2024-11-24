import 'package:flutter/material.dart';
import 'beranda.dart'; // Mengimpor halaman Beranda
import 'profil_page.dart'; // Mengimpor halaman Profil

class ProdukPage extends StatefulWidget {
  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  int _selectedIndex = 1; // Menandakan bahwa halaman Produk yang aktif

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
        // Tetap di halaman Produk
        break;
      case 2:
        // Navigasi ke halaman Profil
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
        title: const Text("Oke Petshop"), // Judul aplikasi
        centerTitle: true,
        backgroundColor: const Color(0xFFD2B48C), // Warna latar belakang AppBar
      ),
      body: Container(
        color: const Color(0xFFD2B48C), // Warna latar belakang body
        padding: const EdgeInsets.all(16.0), // Padding di sekeliling body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Penempatan sumbu silang
          children: [
            const Text(
              "Produk", // Judul produk
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16), // Spasi antara judul dan grid produk
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Jumlah kolom dalam grid
                crossAxisSpacing: 10, // Spasi antar kolom
                mainAxisSpacing: 10, // Spasi antar baris
                childAspectRatio: 9 / 9, // Rasio aspek untuk setiap kartu produk
                children: [
                  // Membuat kartu produk menggunakan fungsi _buildProductCard
                  _buildProductCard(
                    context,
                    "assets/product1.jpeg",
                    "CHOIZE KITTEN",
                  ),
                  _buildProductCard(
                    context,
                    "assets/product2.jpeg",
                    "CHOIZE ADULT TUNA",
                  ),
                  _buildProductCard(
                    context,
                    "assets/product3.jpeg",
                    "CIVILE",
                  ),
                  _buildProductCard(
                    context,
                    "assets/product4.jpeg",
                    "PREMIUM COTTED",
                  ),
                  _buildProductCard(
                    context,
                    "assets/product5.jpeg",
                    "CHOIZE ADULT SALMON",
                  ),
                  _buildProductCard(
                    context,
                    "assets/product6.jpeg",
                    "TALIBITE",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Tipe BottomNavigationBar yang tetap
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk Beranda
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag), // Ikon untuk Produk
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ikon untuk Profil
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex, // Indeks yang saat ini dipilih
        selectedItemColor: Colors.black, // Warna untuk item yang dipilih
        unselectedItemColor: Colors.grey, // Warna untuk item yang tidak dipilih
        onTap: _onItemTapped, // Fungsi yang dipanggil saat item ditekan
      ),
    );
  }

  // Fungsi untuk membangun kartu produk
  Widget _buildProductCard(BuildContext context, String imagePath, String productName) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail produk berdasarkan nama produk
        Navigator.pushNamed(context, productName);
      },
      child: Card(
        elevation: 4, // Elevasi untuk memberikan efek bayangan
        child: Column(
          mainAxisSize: MainAxisSize.min, // Mengatur ukuran kolom
          children: [
            SizedBox(
              width: 270, // Lebar gambar produk
              height: 150, // Tinggi gambar produk
              child: ClipRRect(
                child: Image.asset(
                  imagePath, // Gambar produk
                  fit: BoxFit.cover, // Mengatur cara gambar ditampilkan
                ),
              ),
            ),
            const SizedBox(height: 8), // Spasi antara gambar dan nama produk
            Text(
              productName, // Nama produk
              style: const TextStyle(fontSize: 16), // Gaya teks untuk nama produk
              textAlign: TextAlign.center, // Penempatan teks di tengah
            ),
          ],
        ),
      ),
    );
  }
}
