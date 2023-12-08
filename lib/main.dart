import 'package:flutter/material.dart';
import 'package:restapiktp/screen/create.dart';
import 'package:restapiktp/screen/index.dart';

void main() {
  // Menjalankan aplikasi Flutter
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Ini adalah widget utama dari aplikasi.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Judul aplikasi yang akan ditampilkan pada task manager
      title: 'Flutter Demo',

      // Tema dasar aplikasi menggunakan primary color biru
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Halaman pertama yang ditampilkan ketika aplikasi dijalankan
      home: KtpListScreen(),
    );
  }
}
