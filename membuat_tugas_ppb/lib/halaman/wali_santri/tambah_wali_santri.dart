import 'package:flutter/material.dart';
import '../home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddAuthor extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nohpController = TextEditingController();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _no_kkController = TextEditingController();

  Future tambahAuthor() async {
    final response = await http
        .post(Uri.parse("http://192.168.124.207:2909/api/wali_santri"), body: {
      "nama": _nameController.text,
      "email": _emailController.text,
      "no_hp": _nohpController.text,
      "nik": _nikController.text,
      "no_kk": _no_kkController.text
    });

    print(response.body);

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data Wali Santri"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Nama"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Masukkan Nama Anda";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Masukkan Email Anda";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _nohpController,
              decoration: InputDecoration(labelText: "No. HP"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Masukkan No. HP Anda";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _nikController,
              decoration: InputDecoration(labelText: "NIK"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Masukkan NIK Anda";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _no_kkController,
              decoration: InputDecoration(labelText: "No. KK"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Masukkan No. KK Anda";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  tambahAuthor().then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Data Berhasil di Tambah")));
                  });
                }
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
