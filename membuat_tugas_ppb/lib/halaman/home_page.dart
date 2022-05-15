import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'wali_santri/tambah_wali_santri.dart';
import 'wali_santri/edit_wali_santri.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String? url = "http://192.168.124.207:2909/api/wali_santri";

  Future<List<dynamic>> dataWaliSantri() async {
    var response = await http.get(Uri.parse(url!));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future hapusWaliSantri(String authorId) async {
    final String? urlDelete =
        "http://192.168.98.207:2909/api/wali_santri/" + authorId;

    var response = await http.delete(Uri.parse(urlDelete!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddAuthor()));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Data Wali Santri"),
        ),
        body: FutureBuilder(
          future: dataWaliSantri(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, int index) {
                    return Container(
                      height: 180,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            GestureDetector(
                              // onTap: () {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => Detail(
                              //                 author: snapshot.data[index],
                              //               )));
                              // },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0)),
                                padding: EdgeInsets.all(5),
                                height: 120,
                                width: 120,
                                child: Image.asset(
                                  "assets/images/logo.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        snapshot.data[index]['nama'],
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            snapshot.data[index]['email'])),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditWaliSantri(
                                                        wali: snapshot
                                                            .data[index],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Icon(Icons.edit)),
                                            GestureDetector(
                                                onTap: () {
                                                  hapusWaliSantri(snapshot
                                                          .data[index]['id']
                                                          .toString())
                                                      .then((value) {
                                                    setState(() {});
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "Data Berhasil di Hapus")));
                                                  });
                                                },
                                                child: Icon(Icons.delete)),
                                          ],
                                        ),
                                        Text(snapshot.data[index]['no_hp'])
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Text("Data Error");
            }
          },
        ));
  }
}
