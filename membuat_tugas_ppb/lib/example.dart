import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int counter = 0;
  bool isDark = false;

  Future<void> setPreferences() async {
    final pref = await SharedPreferences.getInstance();

    if (pref.containsKey("myData")) {
      pref.clear();
    }

    final myData = json
        .encode({'counter': counter.toString(), 'isDark': isDark.toString()});

    pref.setString("myData", myData);
    setState(() {});
  }

  Future<void> getPreferences() async {
    final pref = await SharedPreferences.getInstance();

    if (pref.containsKey("myData")) {
      final myData =
          json.decode(pref.getString("myData")!) as Map<String, dynamic>;

      counter = int.parse(myData["counter"]);

      isDark = myData["isDark"] == "true" ? true : false;
    }
  }

  void minus() {
    counter = counter - 1;

    setPreferences();
  }

  void add() {
    counter = counter + 1;
    setPreferences();
  }

  void changeTheme() {
    isDark = !isDark;
    setPreferences();
  }

  void refresh() {
    counter = 0;
    isDark = false;
    setPreferences();
  }

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    primarySwatch: Colors.amber,
    accentColor: Colors.amber,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        side: BorderSide(
          color: Colors.white,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
  );

  ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.amber,
    primarySwatch: Colors.amber,
    accentColor: Colors.amber,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        side: BorderSide(
          color: Colors.black,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPreferences(),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: isDark ? dark : light,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Counter Apps"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.refresh,
                ),
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Angka saat ini adalah : $counter",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: minus,
                      child: Icon(Icons.remove),
                    ),
                    OutlinedButton(
                      onPressed: add,
                      child: Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: changeTheme,
            child: Icon(Icons.color_lens),
          ),
        ),
      ),
    );
  }
}
