import 'package:flutter/material.dart';
import 'package:project_kelompok/home.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});


  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mengisi Biodata"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              // TextField(),
              TextFormField(
                decoration: new InputDecoration(
                  labelText: "NIK",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'NIK tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                decoration: new InputDecoration(
                  labelText: "Nama Lengkap",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(4.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                decoration: new InputDecoration(
                  labelText: "Tanggal Lahir",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(4.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                decoration: new InputDecoration(
                  labelText: "Provinsi",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(4.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                decoration: new InputDecoration(
                  labelText: "Tempat Tinggal",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(4.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                decoration: new InputDecoration(
                  labelText: "Tanggal Pembuatan KTP",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(4.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      HomePage();
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    child: Text(
                      'submit',
                    ),
                  ),
              )

              // RaisedButton(
              //   child: Text(
              //     "Submit",
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   color: Colors.blue,
              //   onPressed: () {
              //     if (_formKey.currentState!.validate()) {}
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
