import 'package:flutter/material.dart';
import 'home_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
        primaryColor: Colors.yellowAccent[700],
        accentColor: Colors.lightBlue[600],
      ),
      title: "Topline",
      home: Home(),
    );
  }
}