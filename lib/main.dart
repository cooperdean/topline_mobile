import 'package:flutter/material.dart';
import 'home_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primaryColor: Colors.grey[900],
        accentColor: Colors.yellow 
      ),
      title: "Topline",
      home: Home(),
    );
  }
}