import 'package:flutter/material.dart';
import 'package:restapiktp/home.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Tambahkan delay untuk simulasi splash screen
    Timer(
      Duration(seconds: 3),
      () {
        // Navigasi ke layar utama setelah splash screen selesai
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) =>
                HomePage(), // Gantilah dengan nama layar utama aplikasi Anda
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Perlu ada implementasi metode build
    return Scaffold(
      body: Center(
        child: FlutterLogo(
            size: 200), // Gantilah dengan widget atau gambar splash screen Anda
      ),
    );
  }
}
