import 'package:flutter/material.dart';
import 'home_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: 
          ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.greenAccent[700],
            accentColor: Colors.greenAccent[600],
          ),
      title: "Topline",
      home: Home(),
    );
  }
}