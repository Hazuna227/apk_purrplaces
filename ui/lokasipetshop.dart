import 'package:flutter/material.dart'; // Mengimpor paket Flutter untuk antarmuka pengguna.
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Mengimpor paket Google Maps untuk Flutter.
import 'profil_page.dart'; // Mengimpor halaman profil.
import 'beranda.dart'; // Mengimpor halaman beranda.
import 'toko_product.dart'; // Mengimpor halaman produk toko.

class LokasiPetShop extends StatefulWidget { // Kelas LokasiPetShop sebagai StatefulWidget.
  const LokasiPetShop({Key? key}) : super(key: key); // Konstruktor untuk LokasiPetShop.

  @override
  _LokasiPetShopState createState() => _LokasiPetShopState(); // Membuat instance dari _LokasiPetShopState.
}

class _LokasiPetShopState extends State<LokasiPetShop> { // Kelas state untuk LokasiPetShop.
  late GoogleMapController mapController; // Controller untuk Google Map.
  int _selectedIndex = 0; // Indeks yang dipilih untuk bottom navigation bar.

  void _onItemTapped(int index) { // Fungsi untuk menangani pengetukan item di bottom navigation bar.
    setState(() {
      _selectedIndex = index; // Memperbarui indeks yang dipilih.
    });
    switch (index) {
      case 0: // Navigasi ke halaman Beranda.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Beranda()),
        );
        break;
      case 1: // Navigasi ke halaman TokoList.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TokoList()),
        );
        break;
      case 2: // Navigasi ke halaman Profil.
        Navigator.pushReplacement(
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
        title: const Text('Nama Petshop'), // Judul halaman, ganti dengan nama petshop yang sesuai.
        centerTitle: true, // Memusatkan judul.
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Ikon kembali.
          onPressed: () => Navigator.pop(context), // Kembali ke halaman sebelumnya.
        ),
      ),
      body: Center( // Membungkus Column dengan Center untuk menempatkan konten di tengah.
        child: Column(
          mainAxisSize: MainAxisSize.min, // Mengatur ukuran kolom sesuai kebutuhan.
          children: [
            // Kotak untuk Map
            Container(
              width: 400, // Lebar peta.
              height: 300, // Tinggi peta.
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), // Membulatkan sudut.
                boxShadow: [ // Menambahkan bayangan.
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller; // Menginisialisasi controller peta.
                },
                initialCameraPosition: const CameraPosition(
                  target: LatLng(-0.0742, 109.3444), // Koordinat lokasi petshop.
                  zoom: 14.0, // Tingkat zoom.
                ),
                markers: { // Menambahkan marker pada peta.
                  const Marker(
                    markerId: MarkerId('Oke Petshop'),
                    position: LatLng(-0.0742, 109.3444), // Posisi marker.
                    infoWindow: InfoWindow(title: 'Oke Petshop'), // Jendela informasi untuk marker.
                  ),
                },
              ),
            ),
            const SizedBox(height: 16), // Spasi antara peta dan alamat.
            // Alamat
            Container(
              width: 400, // Lebar alamat.
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFD2B48C), // Warna coklat untuk latar belakang alamat.
                borderRadius: BorderRadius.circular(8.0), // Membulatkan sudut.
              ),
              alignment: Alignment.centerLeft, // Menyelaraskan teks ke kiri.
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Menambahkan padding horizontal.
              child: const Text(
                'Jl. Padat Karya, Bansir Darat, Kec. Pontianak Tenggara, Kota Pontianak, Kalimantan Barat', // Alamat petshop.
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left, // Menyelaraskan teks ke kiri.
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Tipe bottom navigation bar.
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk halaman Beranda.
            label: "Beranda", // Label untuk halaman Beranda.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag), // Ikon untuk halaman Produk.
            label: "Produk", // Label untuk halaman Produk.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ikon untuk halaman Profil.
            label: "Profil", // Label untuk halaman Profil.
          ),
        ],
        currentIndex: _selectedIndex, // Indeks saat ini yang dipilih.
        selectedItemColor: Colors.black, // Warna untuk item yang dipilih.
        unselectedItemColor: Colors.grey, // Warna untuk item yang tidak dipilih.
        onTap: _onItemTapped, // Fungsi yang dipanggil saat item ditekan.
      ),
    );
  }
}
