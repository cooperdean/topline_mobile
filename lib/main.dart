import 'package:flutter/material.dart';
import 'home_widget.dart';
import 'package:flutter/rendering.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
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