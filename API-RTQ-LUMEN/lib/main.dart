import 'package:flutter/material.dart';
import 'package:membuat_tugas_ppb/halaman/halaman_satu.dart';
import 'package:membuat_tugas_ppb/halaman/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Latihan Tabbar"),
            backgroundColor: Colors.blue[800],
            bottom: TabBar(
              controller: controller,
              tabs: <Tab>[
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.note),
                ),
                Tab(
                  icon: Icon(Icons.note),
                )
              ],
            ),
          ),
          body: TabBarView(
            controller: controller,
            children: <Widget>[
              HomePage(),
              HomePage(),
              HomePage(),
            ],
          ),
        ));
  }
}
