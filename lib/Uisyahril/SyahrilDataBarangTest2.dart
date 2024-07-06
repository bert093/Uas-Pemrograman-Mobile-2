import 'package:flutter/material.dart'; // Mengimpor package material.dart
import 'package:image_picker/image_picker.dart'; // Mengimpor package image_picker
import 'dart:io'; // Mengimpor package dart:io untuk File
import 'package:flutter/foundation.dart'
show kIsWeb; // Mengimpor kIsWeb untuk mendeteksi platform

class Barang {
  final String name; // Deklarasi variabel name
  final String imagePath; // Deklarasi variabel imagePath sebagai String

  Barang(
      {required this.name,
      required this.imagePath}); // Konstruktor untuk class Barang
}

class DataBarangUas extends StatefulWidget {
  const DataBarangUas({super.key}); // Konstruktor untuk class DataBarangUas

  @override
  _BarangPageState createState() => _BarangPageState(); // Membuat state untuk DataBarangUas
}

class _BarangPageState extends State<DataBarangUas> {
  final List<Barang> _items = []; // Deklarasi list untuk menyimpan barang
  final TextEditingController _nameController = TextEditingController(); // Controller untuk input nama barang
  String? _imagePath; // Variabel untuk menyimpan path gambar yang dipilih
 // mengganti file? menjadi String?
  final ImagePicker _picker = ImagePicker(); // Inisialisasi ImagePicker

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery); // Memilih gambar dari galeri

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path; // Menyimpan path gambar yang dipilih
        // awalnya file(pickedFile.path);
      });
    }
  }

  void _addItem() {
    final String name =
        _nameController.text; // Mengambil teks dari _nameController

    if (name.isNotEmpty && _imagePath != null) {
      // Menambahkan kondisi _imagePath tidak null
      setState(() {
        _items.add(Barang(
            name: name,
            imagePath: _imagePath!)); // Menambahkan barang ke dalam list
      });
      _nameController.clear(); // Mengosongkan _nameController
      setState(() {
        _imagePath = null; // Mengosongkan _imagePath
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose(); // Membersihkan _nameController
    super.dispose(); // Memanggil dispose dari superclass
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Input Data Barang'), // Judul AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding untuk body
        child: Column(
          children: [
            TextField(
              controller: _nameController, // Menggunakan _nameController
              decoration: InputDecoration(
                labelText: 'Nama Barang', // Label untuk input nama barang
                border: OutlineInputBorder(), // Border untuk input
              ),
            ),
            SizedBox(height: 10), // Jarak antara input
            ElevatedButton(
              onPressed: _pickImage, // Memanggil _pickImage saat tombol ditekan
              child: Text('Pilih Gambar'), // Teks pada tombol
            ),
            if (_imagePath != null) // Menampilkan gambar yang dipilih
              kIsWeb
                  ? Image.network(
                      _imagePath!,
                      width: 100,
                      height: 100,
                    )
                  : Image.file(
                      File(_imagePath!),
                      width: 100,
                      height: 100,
                    ),
            SizedBox(height: 10), // Jarak antara input
            ElevatedButton(
              onPressed: _addItem, // Memanggil _addItem saat tombol ditekan
              child: Text('Tambahkan Barang'), // Teks pada tombol
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length, // Jumlah item dalam list
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: kIsWeb
                          ? Image.network(
                              _items[index].imagePath, // Menampilkan gambar barang
                              fit: BoxFit.cover, // Menyesuaikan gambar dengan kotak
                              width: 50, // Lebar gambar
                              height: 50, // Tinggi gambar
                            )
                          :Image.file(
                              File(_items[index].imagePath), // Menampilkan gambar barang
                              fit: BoxFit.cover, // Menyesuaikan gambar dengan kotak
                              width: 50, // Lebar gambar
                              height: 50, // Tinggi gambar
                            ),
                      title: Text(_items[index].name), // Menampilkan nama barang
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
