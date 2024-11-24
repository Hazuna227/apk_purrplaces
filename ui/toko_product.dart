import 'package:flutter/material.dart';
import 'package:purrplaces/ui/profil_page.dart'; // Mengimpor halaman Profil
import 'produk_page.dart'; // Mengimpor halaman Produk
import 'beranda.dart'; // Mengimpor halaman Beranda

// Widget utama untuk menampilkan daftar toko
class TokoList extends StatefulWidget {
  @override
  _TokoListState createState() => _TokoListState();
}

// State untuk widget TokoList
class _TokoListState extends State<TokoList> {
  int _selectedIndex = 1; // Set index sesuai dengan posisi TokoList

  // Fungsi untuk menangani saat item di bottom navigation bar dipilih
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        // Navigasi ke halaman Beranda
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Beranda()),
        );
        break;
      case 1:
        // Halaman ini sudah ada (TokoList)
        break;
      case 2:
        // Navigasi ke halaman Profil
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toko"), // Judul halaman Toko
        centerTitle: true, // Mengatur judul agar berada di tengah
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Menambahkan padding di sekitar ListView
        child: ListView(
          children: [
            // Kartu Toko 1
            _buildTokoCard(
              context,
              'Oke Petshop', // Nama toko
              'Jl. Padat Karya, Bansir Darat, Kec. Pontianak Tenggara, Kota Pontianak, Kalimantan Barat', // Alamat toko
              'assets/Oke_Petshop.jpg', // Gambar toko
            ),
            const SizedBox(height: 16.0), // Spasi antar produk

            // Kartu Toko 2
            _buildTokoCard(
              context,
              'Acan Petshop',
              'Jl. Padat Karya, Bansir Darat, Kec. Pontianak Tenggara, Kota Pontianak, Kalimantan Barat',
              'assets/Acan_Petshop.jpeg',
            ),
            const SizedBox(height: 16.0), // Spasi antar produk

            // Kartu Toko 3
            _buildTokoCard(
              context,
              'Crystal Petshop',
              'Jl. Padat Karya, Bansir Darat, Kec. Pontianak Tenggara, Kota Pontianak, Kalimantan Barat',
              'assets/Crystal_Petshop.jpeg',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Mengatur jenis bottom navigation bar
        currentIndex: _selectedIndex, // Indeks yang saat ini dipilih
        selectedItemColor: Colors.black, // Warna untuk item yang dipilih
        onTap: _onItemTapped, // Fungsi yang dipanggil saat item ditekan
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
      ),
    );
  }

  // Fungsi untuk membangun kartu Toko
  Widget _buildTokoCard(BuildContext context, String name, String address, String image) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman Produk saat kartu ditekan
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdukPage(), // Ganti dengan halaman produk yang sesuai
          ),
        );
      },
      child: Card(
        elevation: 4, // Elevasi untuk efek bayangan
        color: Color(0xFFD2B48C), // Set warna kartu ke cokelat
        child: Container(
          padding: const EdgeInsets.all(16.0), // Padding di dalam kartu
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  image, // Gambar toko
                  width: 50, // Atur lebar gambar
                  height: 50, // Atur tinggi gambar
                  fit: BoxFit.cover, // Atur cara gambar ditampilkan
                ),
              ),
              const SizedBox(width: 16.0), // Spasi antara gambar dan teks
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Mengatur alignment kolom ke kiri
                  children: [
                    Text(
                      name, // Nama toko
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, // Mengatur berat teks menjadi bold
                        fontSize: 18.0, // Ukuran font nama toko
                        color: Colors.black, // Ubah warna teks untuk kontras
                      ),
                    ),
                    const SizedBox(height: 8.0), // Spasi antara nama dan alamat
                    Text(
                      address, // Alamat toko
                      style: const TextStyle(
                        fontSize: 14.0, // Ukuran font alamat toko
                        color: Colors.black, // Ubah warna teks untuk kontras
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
