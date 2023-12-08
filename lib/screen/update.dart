import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdatePage extends StatefulWidget {
  final String nik;

  UpdatePage({Key? key, required this.nik}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late TextEditingController namaController;
  late TextEditingController tanggalLahirController;
  late TextEditingController provinsiController;
  late TextEditingController tempatTinggalController;

  @override
  void initState() {
    super.initState();

    // Inisialisasi controller untuk setiap input field
    namaController = TextEditingController();
    tanggalLahirController = TextEditingController();
    provinsiController = TextEditingController();
    tempatTinggalController = TextEditingController();

    // Mengambil data yang sudah ada ketika halaman diinisialisasi
    fetchData();
  }

  // Fungsi untuk mengambil data dari server berdasarkan NIK
  Future<void> fetchData() async {
    final url =
        "http://192.168.10.105/rest_api_crud/update.php"; // Ganti dengan URL PHP script Anda
    final response = await http.post(Uri.parse(url), body: {'nik': widget.nik});

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      // Mengupdate nilai controller dengan data yang sudah ada
      setState(() {
        namaController.text = data['nama'];
        tanggalLahirController.text = data['tanggal_lahir'];
        provinsiController.text = data['provinsi'];
        tempatTinggalController.text = data['tempat_tinggal'];
      });
    } else {
      print(
          "Gagal mengambil data untuk diedit. Error: ${response.reasonPhrase}");
    }
  }

  // Fungsi untuk mengirim data terupdate ke server
  Future<void> updateData() async {
    final url =
        "http://localhost/your_project/update_data.php"; // Ganti dengan URL PHP script Anda

    final response = await http.post(
      Uri.parse(url),
      body: {
        'nik': widget.nik,
        'nama': namaController.text,
        'tanggal_lahir': tanggalLahirController.text,
        'provinsi': provinsiController.text,
        'tempat_tinggal': tempatTinggalController.text,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print(data['message']);
      // Kembali ke halaman sebelumnya setelah berhasil mengupdate data
      Navigator.pop(context);
    } else {
      print("Gagal mengupdate data. Error: ${response.reasonPhrase}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Page'),
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

            // Tombol untuk melakukan update data
            ElevatedButton(
              onPressed: updateData,
              child: Text('Update Data'),
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
