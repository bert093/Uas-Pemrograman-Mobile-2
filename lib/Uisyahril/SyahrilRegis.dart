import 'package:flutter/material.dart';
import 'package:uas_flutter_d1/Uisyahril/SyahrilLogin.dart'; // menambahkan package SyahrilLogin.dart

class RegisterUas extends StatefulWidget {
  const RegisterUas({super.key});

  @override
  _UserProfileFormState createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<RegisterUas> {
  // Controllers for text fields
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tlpnController = TextEditingController();
  final TextEditingController _emailController =
      TextEditingController(); // Menambahkan Email Controller
  final TextEditingController _pswdController =
      TextEditingController(); // Menambahkan Password Controller

  // Variables for other inputs
  bool _setuju = false;
  String _jenisKelamin = '';
  String _pilihKota = '<pilih>';

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _namaController.dispose();
    _emailController.dispose();
    _tlpnController.dispose();
    _pswdController.dispose();
    super.dispose();
  }

  void _register() {
    String nama = _namaController.text;
    String email = _emailController.text; // menambahkan email controller
    String password = _pswdController.text;

    if (nama.isEmpty || email.isEmpty || password.isEmpty || _jenisKelamin.isEmpty || _pilihKota == '<pilih>' || _tlpnController.text.isEmpty || _setuju == false) {
      // menambahkan kondisi yang kosong
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Kesalahan !!'),
            content:
                Text('Nama, email, password, jenis kelamin, pilih kota, persetujuan, dan nomor telepon tidak boleh kosong'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Navigator.pushNamed dengan arguments untuk mengirim data ke halaman login
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginUas(
            registeredNama02: nama,
            registeredEmail02: email, // mengganti registeredEmail02 dengan email
            registeredPassword02: password,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Register UAS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Nama input
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            // Email input
            TextField(
              controller: _emailController, // emailController
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _pswdController, // password controller
              decoration: InputDecoration(labelText: 'Password'),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            // Telepon input
            TextField(
              controller: _tlpnController, // telepon controller
              decoration: InputDecoration(labelText: 'Telepon'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            // Jenis Kelamin selection
            Text('Jenis Kelamin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ListTile(
              title: const Text('Pria'),
              leading: Radio<String>(
                value: 'Pria',
                groupValue: _jenisKelamin,
                onChanged: (String? value) {
                  setState(() {
                    _jenisKelamin = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Wanita'),
              leading: Radio<String>(
                value: 'Wanita',
                groupValue: _jenisKelamin,
                onChanged: (String? value) {
                  setState(() {
                    _jenisKelamin = value!;
                  });
                },
              ),
            ),
            //Radio button Jenis Kelamin jangan ditambah lagi Pesan: MdYd.
            const SizedBox(height: 20),
            // Kota Terdekat selection
            const Text('Kota Terdekat',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _pilihKota,
              onChanged: (String? newValue) {
                setState(() {
                  _pilihKota = newValue!;
                });
              },
              items: <String>[
                '<pilih>',
                'Mataram',
                'Peraya',
                'Selong',
                'Tanjung',
                'Sumbawa',
                'Dompu',
                'Bima',
                'Diluar NTB'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Subscription checkbox
            CheckboxListTile(
              title: const Text('Saya setuju dengan peraturan yang berlaku'),
              value: _setuju,
              onChanged: (bool? value) {
                setState(() {
                  _setuju = value!;
                });
              },
            ),
            SizedBox(height: 20),
            // Submit button
            ElevatedButton(
              onPressed: () {
                _register();
                // String nama = _namaController.text; // mengambil nilai dari text field nama
                // String email = _emailController.text; // mengambil nilai dari text field email
                // // String password = _pswdController.text; (pak made)
                // String tlpn = _tlpnController.text; // mengambil nilai dari text field telepon
                // String jenisKel = _jenisKelamin; // mengambil nilai dari radio button jenis kelamin
                // String kota = _pilihKota; // mengambil nilai dari dropdown kota terdekat
                // bool setuju = _setuju; // mengambil nilai dari checkbox persetujuan
                // print('Nama: $nama'); // mencetak nilai nama
                // print('Email: $email'); // mencetak nilai email
                // print('Telepon: $tlpn'); // mencetak nilai telepon
                // print('Jenis Kelamin: $jenisKel'); // mencetak nilai jenis kelamin
                // print('Kota Terdekat: $kota'); // mencetak nilai kota terdekat
                // print('Persetujuan: $setuju'); // mencetak nilai persetujuan
              },
              child: Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
