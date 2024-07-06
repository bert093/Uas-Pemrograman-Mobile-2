// import 'package:flutter/material.dart'; // Mengimpor package material.dart
// import 'package:image_picker/image_picker.dart'; // Mengimpor package image_picker
// import 'dart:io'; // Mengimpor package dart:io untuk File

// class Barang {
//   final String name; // Deklarasi variabel name
//   final File image; // Deklarasi variabel image sebagai File

//   Barang({required this.name,required this.image}); // Konstruktor untuk class Barang
// }

// class DataBarangUas extends StatefulWidget {
//   const DataBarangUas({super.key}); // Konstruktor untuk class DataBarangUas

//   @override
//   _BarangPageState createState() =>
//       _BarangPageState(); // Membuat state untuk DataBarangUas
// }

// class _BarangPageState extends State<DataBarangUas> {
//   final List<Barang> _items = []; // Deklarasi list untuk menyimpan barang
//   final TextEditingController _nameController = TextEditingController(); // Controller untuk input nama barang
//   File? _image; // Variabel untuk menyimpan gambar yang dipilih

//   final ImagePicker _picker = ImagePicker(); // Inisialisasi ImagePicker

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(
//         source: ImageSource.gallery); // Memilih gambar dari galeri 

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path); // Menyimpan gambar yang dipilih
//       });
//     }
//   }

//   void _addItem() {
//     final String name =
//         _nameController.text; // Mengambil teks dari _nameController

//     if (name.isNotEmpty && _image != null) {
//       // Menambahkan kondisi _image tidak null
//       setState(() {
//         _items.add(Barang(
//             name: name, image: _image!)); // Menambahkan barang ke dalam list
//       });
//       _nameController.clear(); // Mengosongkan _nameController
//       setState(() {
//         _image = null; // Mengosongkan _image
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _nameController.dispose(); // Membersihkan _nameController
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
//             ElevatedButton(
//               onPressed: _pickImage, // Memanggil _pickImage saat tombol ditekan
//               child: Text('Pilih Gambar'), // Teks pada tombol
//             ),
//             if (_image != null) // Menampilkan gambar yang dipilih
//               Image.file(
//                 _image!,
//                 width: 100,
//                 height: 100,
//               ),
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
//                       leading: Image.file(
//                         _items[index].image, // Menampilkan gambar barang
//                         fit: BoxFit.cover, // Menyesuaikan gambar dengan kotak
//                         width: 50, // Lebar gambar
//                         height: 50, // Tinggi gambar
//                       ),
//                       title:
//                           Text(_items[index].name), // Menampilkan nama barang
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
