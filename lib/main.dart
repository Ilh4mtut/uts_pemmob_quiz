import 'package:flutter/material.dart';
import 'package:kuizz_app/models/pertanyaan_model.dart';
import './screens/home_screen.dart';
import './models/db_connect.dart';

void main() {
  runApp(
    const MyApp(), // Menjalankan aplikasi Flutter
  );
}

//My app widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:
          false, // Menyembunyikan banner debug di sudut kanan atas
      home:
          HomeScreen(), // Menetapkan HomeScreen sebagai halaman utama aplikasi
    );
  }
}
