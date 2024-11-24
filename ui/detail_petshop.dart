import 'package:flutter/material.dart';
import 'package:purrplaces/ui/profil_page.dart'; 
import 'package:purrplaces/ui/toko_product.dart'; 
import 'deskripsi_page.dart'; 
import 'beranda.dart'; 
import 'lokasipetshop.dart';
import 'produk_page.dart'; 

class DetailPetShop extends StatefulWidget { // Kelas untuk halaman Detail PetShop.
  final String name; // Nama petshop.
  final String address; // Alamat petshop.
  final String imagePath; // Jalur gambar petshop.
  final String description; // Deskripsi petshop.
  final String nohp; // Nomor telepon petshop.
  final List<String> jambuka; // Jam buka petshop.

  const DetailPetShop({ // Konstruktor untuk kelas DetailPetShop.
    super.key,
    required this.name,
    required this.address,
    required this.imagePath,
    required this.description,
    required this.nohp,
    required this.jambuka,
  });

  @override
  _DetailPetShopState createState() => _DetailPetShopState(); // Mengembalikan state untuk DetailPetShop.
}

class _DetailPetShopState extends State<DetailPetShop> { // State untuk kelas DetailPetShop.
  int _selectedIndex = 1; // Halaman Produk sebagai default aktif.

  void _onItemTapped(int index) { // Fungsi untuk menangani tap pada item navigasi bawah.
    setState(() {
      _selectedIndex = index; // Memperbarui indeks yang dipilih.
    });
    switch (index) { // Memeriksa item mana yang ditekan.
      case 0:
        Navigator.pushReplacement( // Navigasi ke halaman Beranda.
          context,
          MaterialPageRoute(builder: (context) => const Beranda()),
        );
        break;
      case 1:
        Navigator.pushReplacement( // Navigasi ke halaman Toko Produk.
          context,
          MaterialPageRoute(builder: (context) => TokoList()),
        );
        break;
      case 2:
        Navigator.pushReplacement( // Navigasi ke halaman Profil.
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) { // Fungsi untuk membangun UI.
    return Scaffold( // Menggunakan scaffold untuk struktur halaman.
      appBar: AppBar(
        title: Text(widget.name), // Menampilkan nama petshop di judul.
        centerTitle: true, // Mengatur judul agar berada di tengah.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding untuk konten.
        child: Column( // Menggunakan kolom untuk menyusun widget secara vertikal.
          crossAxisAlignment: CrossAxisAlignment.stretch, // Menyelaraskan elemen ke seluruh lebar.
          children: [
            const SizedBox(height: 20), // Spasi di atas tombol.
            _buildButton(context, 'Deskripsi', const Color(0xFFD2B48C), () { // Tombol untuk navigasi ke Deskripsi.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeskripsiPage(
                    name: widget.name,
                    address: widget.address,
                    imagePath: widget.imagePath,
                    description: widget.description,
                    nohp: widget.nohp,
                    jambuka: widget.jambuka,
                  ),
                ),
              );
            }),
            const SizedBox(height: 16), // Spasi antara tombol.
            _buildButton(context, 'Produk', const Color(0xFFD2B48C), () { // Tombol untuk navigasi ke Produk.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProdukPage()),
              );
            }),
            const SizedBox(height: 16), // Spasi antara tombol.
            _buildButton(context, 'Lokasi', const Color(0xFFD2B48C), () { // Tombol untuk navigasi ke Lokasi.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LokasiPetShop()),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar( // Menambahkan navigasi bawah.
        items: const [ // Item navigasi.
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk Beranda.
            label: "Beranda", // Label untuk Beranda.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag), // Ikon untuk Produk.
            label: "Produk", // Label untuk Produk.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ikon untuk Profil.
            label: "Profil", // Label untuk Profil.
          ),
        ],
        currentIndex: _selectedIndex, // Menampilkan item yang dipilih.
        selectedItemColor: Colors.black, // Warna untuk item yang dipilih.
        unselectedItemColor: Colors.grey, // Warna untuk item yang tidak dipilih.
        onTap: _onItemTapped, // Menangani tap pada item navigasi.
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Color color, VoidCallback onPressed) { // Fungsi untuk membangun tombol.
    return SizedBox(
      height: 50, // Tinggi tombol.
      child: ElevatedButton(
        onPressed: onPressed, // Aksi saat tombol ditekan.
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Warna latar belakang tombol.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Sudut membulat untuk tombol.
          ),
          elevation: 3, // Efek elevasi tombol.
        ),
        child: Text(
          text, // Teks tombol.
          style: const TextStyle(
            fontSize: 18, // Ukuran font untuk teks tombol.
            fontWeight: FontWeight.bold, // Membuat teks tebal.
            color: Colors.black, // Warna teks.
          ),
        ),
      ),
    );
  }
}
