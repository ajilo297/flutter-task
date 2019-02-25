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
        primaryColor: Colors.red,
        brightness: Brightness.dark,
      ),
      routes: {
        "/": (_) => LoginPage(),
      },
    );
  }
}
