import 'package:flutter/material.dart';
// import 'package:uas_flutter_d1/Uisyahril/SyahrilLogin.dart';
// import 'package:uas_flutter_d1/Uisyahril/syahrilDataBarangtest.dart';
import 'package:uas_flutter_d1/Uisyahril/SyahrilRegis.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterUas(), // menambahkan RegisterUas sebagai halaman utama
    );
  }
}
