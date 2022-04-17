import 'package:flutter/material.dart';
import 'package:membuat_tugas_ppb/halaman/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mohammad",
      home: HomePage(),
    );
  }
}
