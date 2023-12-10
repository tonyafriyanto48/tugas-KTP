import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  late TextEditingController namaController;
  late TextEditingController tanggalLahirController;
  late TextEditingController provinsiController;
  late TextEditingController tempatTinggalController;
  final _formKey = GlobalKey<FormState>(); // Add this line

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController();
    tanggalLahirController = TextEditingController();
    provinsiController = TextEditingController();
    tempatTinggalController = TextEditingController();
  }

  Future<void> createData() async {
    final url = "http://192.168.11.15/php_data/create.php";

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
      Navigator.pop(context);
    } else {
      print("Failed to create data. Error: ${response.reasonPhrase}");
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
        child: Form(
          // Wrap your form with a Form widget
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                // Use TextFormField instead of TextField
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: tanggalLahirController,
                decoration: InputDecoration(
                  labelText: 'tanggal Lahir',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: provinsiController,
                decoration: InputDecoration(
                  labelText: 'provinsi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: tempatTinggalController,
                decoration: InputDecoration(
                  labelText: 'tempat tinggal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    createData();
                  }
                },
                child: Text('Create Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    tanggalLahirController.dispose();
    provinsiController.dispose();
    tempatTinggalController.dispose();
    super.dispose();
  }
}
