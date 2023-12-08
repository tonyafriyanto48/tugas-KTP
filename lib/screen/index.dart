import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapiktp/screen/delete.dart';
import 'package:restapiktp/screen/update.dart';
import 'package:restapiktp/screen/create.dart'; // Import CreatePage

class KtpListScreen extends StatefulWidget {
  @override
  _KtpListScreenState createState() => _KtpListScreenState();
}

class _KtpListScreenState extends State<KtpListScreen> {
  List<Map<String, dynamic>> data = [];

  // Fungsi untuk mengambil data dari server
  Future<void> fetchData() async {
    final url =
        "http://192.168.11.15/php_data/list.php"; // Ganti dengan URL PHP script Anda
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Respon sukses, update data pada State
      setState(() {
        data = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      // Request gagal dengan error
      print("Gagal mengambil data. Error: ${response.reasonPhrase}");
    }
  }

  @override
  void initState() {
    super.initState();
    // Memanggil fungsi fetchData() saat widget diinisialisasi
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Index Page'),
        actions: [
          // Menambahkan FloatingActionButton pada AppBar untuk membuat data baru
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navigasi ke CreatePage ketika ikon tambah ditekan
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreatePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: data.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Nik: ${data[index]['nik']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama: ${data[index]['nama']}'),
                      Text('Tanggal Lahir: ${data[index]['tanggal_lahir']}'),
                      Text('Provinsi: ${data[index]['provinsi']}'),
                      Text('Tempat Tinggal: ${data[index]['tempat_tinggal']}'),
                      Text('Tanggal Pembuatan: ${data[index]['date']}'),
                      // Tambahkan field lain sesuai kebutuhan
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Ekstrak nilai 'nik' dari map data
                          String nik = data[index]['nik'];

                          // Navigasi ke UpdatePage dan kirim nilai 'nik'
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdatePage(nik: nik),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Ekstrak nilai 'nik' dari map data
                          String nik = data[index]['nik'];

                          // Navigasi ke DeletePage dan kirim nilai 'nik'
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeletePage(nik: nik),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
