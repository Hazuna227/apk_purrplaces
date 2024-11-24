class PetShop {
  final String name;
  final String address;
  final String imagePath;
  final String description;
  final String nohp;
  final List<String> jambuka;

  PetShop(
      {required this.name,
      required this.address,
      required this.imagePath,
      required this.description,
      required this.nohp,
      required this.jambuka,
      });
}

// Daftar pet shop
List<PetShop> petShops = [
  PetShop(
    name: 'Oke Petshop',
    address:
        'Jl. Padat Karya, Bansir Darat, Kec. Pontianak Tenggara, Kota Pontianak, Kalimantan Barat',
    imagePath: 'assets/Oke_Petshop.jpg',
    description:
        'Pet shop di Kota Pontianak. Toko ini menyediakan berbagai kebutuhan untuk binatang peliharaan seperti pakan kucing, pakan anjing, pasir, aksesori hewan peliharaan, perengkapan grooming, vitamin, obat-obatan, kandang, dan lain sebagainya.',
    nohp: '0812-5665-9933',
    jambuka: [
      'Senin  (08.00 - 21.00)',
      'Selasa (08.00 - 21.00)',
      'Rabu   (08.00 - 21.00)',
      'Kamis  (08.00 - 21.00)',
      'Jumat  (08.00 - 21.00)',
      'Sabtu  (08.00 - 21.00)',
      'Minggu (09.00 - 21.00)',
    ],
  ),
  PetShop(
    name: 'Acan Petshop',
    address:
        'Jl. Padat Karya, Bansir Darat, Kec. Pontianak Tenggara, Kota Pontianak, Kalimantan Barat',
    imagePath: 'assets/Acan_Petshop.jpeg',
    description:
        'Pet shop di Kota Pontianak. Toko ini menyediakan berbagai kebutuhan untuk binatang peliharaan seperti pakan kucing, pakan anjing, pasir, aksesori hewan peliharaan, perengkapan grooming, vitamin, obat-obatan, kandang, dan lain sebagainya.',
    nohp: '0812-5665-9933',
    jambuka: [
      'Senin  (08.00 - 21.00)',
      'Selasa (08.00 - 21.00)',
      'Rabu   (08.00 - 21.00)',
      'Kamis  (08.00 - 21.00)',
      'Jumat  (08.00 - 21.00)',
      'Sabtu  (08.00 - 21.00)',
      'Minggu (09.00 - 21.00)',
    ],
  ),
    PetShop(
    name: 'Crystal Petshop',
    address:
        'Jl. Padat Karya, Bansir Darat, Kec. Pontianak Tenggara, Kota Pontianak, Kalimantan Barat',
    imagePath: 'assets/Crystal_Petshop.jpeg',
    description:
        'Pet shop di Kota Pontianak. Toko ini menyediakan berbagai kebutuhan untuk binatang peliharaan seperti pakan kucing, pakan anjing, pasir, aksesori hewan peliharaan, perengkapan grooming, vitamin, obat-obatan, kandang, dan lain sebagainya.',
    nohp: '0812-5665-9933',
    jambuka: [
      'Senin  (08.00 - 21.00)',
      'Selasa (08.00 - 21.00)',
      'Rabu   (08.00 - 21.00)',
      'Kamis  (08.00 - 21.00)',
      'Jumat  (08.00 - 21.00)',
      'Sabtu  (08.00 - 21.00)',
      'Minggu (09.00 - 21.00)',
    ],
  ),
];
