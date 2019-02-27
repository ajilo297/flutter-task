import 'package:flutter/material.dart';

import 'pages/pages.dart';

void main() => runApp(MainApplication());

class MainApplication extends StatefulWidget {
  @override
  MainApplicationState createState() => MainApplicationState();
}

class MainApplicationState extends State<MainApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 150, 0, 0),
        accentColor: Color.fromARGB(255, 155, 0, 155),
        brightness: Brightness.light,
      ),
      routes: {
        "/": (_) => LoginPage(),
      },
    );
  }
}
