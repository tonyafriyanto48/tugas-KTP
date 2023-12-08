import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  // Inisialisasi controller untuk setiap input field
  late TextEditingController namaController;
  late TextEditingController tanggalLahirController;
  late TextEditingController provinsiController;
  late TextEditingController tempatTinggalController;

  @override
  void initState() {
    super.initState();

    // Inisialisasi controller saat widget diinisialisasi
    namaController = TextEditingController();
    tanggalLahirController = TextEditingController();
    provinsiController = TextEditingController();
    tempatTinggalController = TextEditingController();
  }

  // Fungsi untuk membuat data baru
  Future<void> createData() async {
    final url =
        "http://192.168.11.15/php_data/create.php"; // Ganti dengan URL PHP script Anda

    final response = await http.post(
      Uri.parse(url),
      body: {
        'nama': namaController.text,
        'tanggal_lahir': tanggalLahirController.text,
        'provinsi': provinsiController.text,
        'tempat_tinggal': tempatTinggalController.text,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print(data['message']);

      // Opsional: Navigasi kembali ke halaman sebelumnya (index page)
      Navigator.pop(context);
    } else {
      print("Gagal membuat data. Error: ${response.reasonPhrase}");
      // Handle error, tampilkan snackbar, atau pesan error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input field untuk nama
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),

            // Input field untuk tanggal lahir
            TextField(
              controller: tanggalLahirController,
              decoration: InputDecoration(labelText: 'Tanggal Lahir'),
            ),

            // Input field untuk provinsi
            TextField(
              controller: provinsiController,
              decoration: InputDecoration(labelText: 'Provinsi'),
            ),

            // Input field untuk tempat tinggal
            TextField(
              controller: tempatTinggalController,
              decoration: InputDecoration(labelText: 'Tempat Tinggal'),
            ),

            SizedBox(height: 16),

            // Tombol untuk membuat data baru
            ElevatedButton(
              onPressed: createData,
              child: Text('Create Data'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Membersihkan controller ketika widget di dispose
    namaController.dispose();
    tanggalLahirController.dispose();
    provinsiController.dispose();
    tempatTinggalController.dispose();
    super.dispose();
  }
}
