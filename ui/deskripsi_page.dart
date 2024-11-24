import 'package:flutter/material.dart';
import 'package:purrplaces/ui/beranda.dart';
import 'package:purrplaces/ui/toko_product.dart';

class DeskripsiPage extends StatefulWidget {
  final String name;
  final String address;
  final String imagePath;
  final String description;
  final String nohp;
  final List<String> jambuka;

  const DeskripsiPage({
    Key? key,
    required this.name,
    required this.address,
    required this.imagePath,
    required this.description,
    required this.nohp,
    required this.jambuka,
  }) : super(key: key);

  @override
  _DeskripsiPageState createState() => _DeskripsiPageState();
}

class _DeskripsiPageState extends State<DeskripsiPage> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Beranda()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TokoList()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Center(child: Text('Halaman Profil')),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack( // Menggunakan Stack untuk menumpuk gambar dan konten
        children: [
          SingleChildScrollView( // Konten yang dapat digulir
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding untuk konten
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 220), // Menambah ruang di atas konten
                _buildSectionTitle('Deskripsi'),
                _buildSectionContent(widget.description),
                _buildSectionTitle('Alamat'),
                _buildSectionContent(widget.address),
                _buildSectionTitle('Nomor Telepon'),
                _buildSectionContent(widget.nohp),
                _buildSectionTitle('Jam buka'),
                _buildSectionContent(widget.jambuka.join('\n')),
              ],
            ),
          ),
          // Gambar Petshop yang tetap
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFD2B48C),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        content,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
