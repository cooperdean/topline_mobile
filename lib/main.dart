import 'package:flutter/material.dart';
import 'home_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(
        primaryColor: Colors.indigo[800],
        accentColor: Colors.greenAccent[600],
      ),
      title: "Topline",
      home: Home(),
    );
  }
}