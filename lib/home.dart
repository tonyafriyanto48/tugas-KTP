import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kelompok/data.dart';
import 'package:project_kelompok/form.dart';

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
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const FormPage()));
                },
                child: const Text("Mengisi Biodata")
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DataPage()));
                },
                child: const Text("Menampilkan Data")
            ),
          ],
        ),
      ),
    );
  }
}
