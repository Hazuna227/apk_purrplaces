import 'package:flutter/material.dart'; // Mengimpor paket Flutter untuk penggunaan widget dan material design
import 'package:purrplaces/ui/profil_page.dart'; 
import 'package:purrplaces/ui/toko_product.dart'; 
import 'package:purrplaces/widget/sidebar.dart'; 
import '../ui/detail_petshop.dart'; 
import 'petshop_data.dart'; // Mengimpor data petshop dari file lain

// Kelas utama untuk halaman Beranda
class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  _BerandaState createState() => _BerandaState();
}

// State untuk kelas Beranda
class _BerandaState extends State<Beranda> {
  // Kontroler untuk field pencarian
  TextEditingController searchController = TextEditingController();
  List<PetShop> filteredPetShops = petShops; // Daftar petshop yang difilter

  // Fungsi untuk memfilter petshop berdasarkan input pencarian
  void _filterPetShops() {
    setState(() {
      String query = searchController.text.toLowerCase();
      filteredPetShops = petShops // Mengambil petshop yang sesuai dengan pencarian
          .where((petShop) => petShop.name.toLowerCase().contains(query) ||
              petShop.address.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose(); // Membebaskan sumber daya kontroler
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(), // Menambahkan sidebar navigasi
      appBar: AppBar(
        title: const Text('PurrPlaces'), // Judul aplikasi
      ),
      body: _buildHome(), // Memanggil fungsi untuk membangun isi halaman
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Produk",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Navigasi berdasarkan item yang dipilih
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Beranda()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TokoList()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
        },
      ),
    );
  }

  // Fungsi untuk membangun tampilan utama
  Widget _buildHome() {
    return Column(
      children: [
        // Kontainer untuk banner
        Container(
          height: MediaQuery.of(context).size.height * 0.30,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/Banner_PurrPlaces.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Field pencarian
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Pencarian",
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: _filterPetShops, // Memanggil fungsi filter saat tombol ditekan
              ),
            ),
            onSubmitted: (value) => _filterPetShops(), // Memfilter saat teks dikirim
          ),
        ),
        const SizedBox(height: 20),
        Expanded( // Memanfaatkan ruang yang tersedia
          child: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            physics: const AlwaysScrollableScrollPhysics(), // Mengaktifkan scroll pada GridView
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 8 / 7, // Menentukan rasio aspek untuk kartu
            ),
            itemCount: filteredPetShops.length,
            itemBuilder: (context, index) {
              return buildPetShopCard(
                context,
                filteredPetShops[index].imagePath,
                filteredPetShops[index].name,
                filteredPetShops[index].address, 
                filteredPetShops[index].description,
                filteredPetShops[index].nohp,
                filteredPetShops[index].jambuka,
              );
            },
          ),
        ),
      ],
    );
  }

  // Fungsi untuk membangun kartu petshop
  Widget buildPetShopCard(BuildContext context, String imagePath, String name,
      String address, String description, String nohp, List<String> jambuka) {
    return Container(
      width: 180,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPetShop(
                name: name,
                address: address,
                imagePath: imagePath,
                description: description,
                nohp: nohp,
                jambuka: jambuka,
              ),
            ),
          );
        },
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar petshop
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imagePath,
                  height: 100, // Tinggi gambar petshop
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Text('Gambar tidak ditemukan'));
                  },
                ),
              ),
              // Nama petshop
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flexible( // Mengizinkan teks untuk fleksibel
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    maxLines: 2, // Membatasi nama hingga 2 baris
                    overflow: TextOverflow.ellipsis, // Menangani overflow
                  ),
                ),
              ),
              // Alamat petshop
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Flexible( // Mengizinkan teks untuk fleksibel
                  child: Text(
                    address,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    maxLines: 2, // Membatasi alamat hingga 2 baris
                    overflow: TextOverflow.ellipsis, // Menangani overflow
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
