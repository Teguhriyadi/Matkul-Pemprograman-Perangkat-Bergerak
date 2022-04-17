import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.archive),
              Text("Data Wali Santri",
                  style: new TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Card(
            child: Column(
              children: <Widget>[Text("Ini Halaman Home")],
            ),
          )
        ],
      ),
    );
  }
}
