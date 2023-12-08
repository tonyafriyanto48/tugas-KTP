import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeletePage extends StatefulWidget {
  final String nik;

  DeletePage({required this.nik});

  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  Future<void> deleteData() async {
    // URL PHP script yang digunakan untuk menghapus data
    final url = "http://192.168.11.15/php_data/delete.php";

    // Mengirim request POST ke server PHP dengan parameter 'nik' yang akan dihapus
    final response = await http.post(
      Uri.parse(url),
      body: {
        'nik': widget.nik,
      },
    );

    if (response.statusCode == 200) {
      // Jika respons server sukses (status code 200), kita mendecode pesan dari server
      final Map<String, dynamic> data = json.decode(response.body);
      print(data['message']);
      // Secara opsional, navigasi kembali ke layar sebelumnya
      Navigator.pop(context);
    } else {
      // Jika terjadi kesalahan, print pesan kesalahan atau tampilkan snackbar
      print("Failed to delete data. Error: ${response.reasonPhrase}");
      // Handle error, show a snackbar, or display an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Teks konfirmasi untuk pengguna
            Text(
              'Apakah Anda yakin ingin menghapus?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol 'No' untuk batal menghapus dan kembali ke halaman sebelumnya
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                        context); // Tutup halaman hapus dan kembali ke Index.dart
                  },
                  child: Text('No'),
                ),
                SizedBox(width: 16),
                // Tombol 'Yes' untuk mengkonfirmasi penghapusan data
                ElevatedButton(
                  onPressed: deleteData,
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Text('Yes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
