import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:restapiktp/data.dart';
// import 'package:restapiktp/form.dart';
import 'package:restapiktp/screen/create.dart';
import 'package:restapiktp/screen/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreatePage()));
                },
                child: const Text("Mengisi Biodata")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => KtpListScreen()));
                },
                child: const Text("Menampilkan Data")),
          ],
        ),
      ),
    );
  }
}
