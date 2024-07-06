// import 'package:flutter/material.dart'; // Mengimpor package material.dart

// class Barang {
//   final String name; // Deklarasi variabel name
//   final String image; // Deklarasi variabel image

//   Barang({required this.name, required this.image}); // Konstruktor untuk class Barang
// }

// class DataBarangUas extends StatefulWidget {
//   const DataBarangUas({super.key}); // Konstruktor untuk class DataBarangUas

//   @override
//   _BarangPageState createState() => _BarangPageState(); // Membuat state untuk DataBarangUas
// }

// class _BarangPageState extends State<DataBarangUas> {
//   final List<Barang> _items = []; // Deklarasi list untuk menyimpan barang
//   final TextEditingController _nameController = TextEditingController(); // Controller untuk input nama barang
//   final TextEditingController _imageController = TextEditingController(); // Menambahkan image controller

//   void _addItem() {
//     final String name = _nameController.text; // Mengambil teks dari _nameController
//     final String image = _imageController.text; // Mengambil teks dari _imageController

//     if (name.isNotEmpty || image.isNotEmpty) { // menambahkan kondisi image.isNotEmpty
//       setState(() {
//         _items.add(Barang(name: name, image: image)); // Menambahkan barang ke dalam list
//       });
//       _nameController.clear(); // Mengosongkan _nameController
//       _imageController.clear(); // Mengosongkan _imageController
//     }
//   }

//   @override
//   void dispose() {
//     _nameController.dispose(); // Membersihkan _nameController
//     _imageController.dispose(); // Membersihkan _imageController
//     super.dispose(); // Memanggil dispose dari superclass
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Form Input Data Barang'), // Judul AppBar
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0), // Padding untuk body
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController, // Menggunakan _nameController
//               decoration: InputDecoration(
//                 labelText: 'Nama Barang', // Label untuk input nama barang
//                 border: OutlineInputBorder(), // Border untuk input
//               ),
//             ),
//             SizedBox(height: 10), // Jarak antara input
//             TextField(
//               controller: _imageController, // mengganti menjadi image controller
//               decoration: InputDecoration(
//                 labelText: 'URL Gambar Barang', // Label untuk input URL gambar barang
//                 border: OutlineInputBorder(), // Border untuk input
//               ),
//             ),
//             SizedBox(height: 10), // Jarak antara input
//             ElevatedButton(
//               onPressed: _addItem, // Memanggil _addItem saat tombol ditekan
//               child: Text('Tambahkan Barang'), // Teks pada tombol
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _items.length, // Jumlah item dalam list
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: ListTile(
//                       leading: Image.network(
//                         _items[index].image, // Menampilkan gambar barang
//                         fit: BoxFit.cover, // Menyesuaikan gambar dengan kotak
//                         width: 50, // Lebar gambar
//                         height: 50, // Tinggi gambar
//                       ),
//                       title: Text(_items[index].name), // Menampilkan nama barang
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }