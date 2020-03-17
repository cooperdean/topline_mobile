import 'package:flutter/material.dart';
import 'line_updates.dart';
import 'lines_tab.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    LinesTab(),
    LineUpdatesTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Topsix", 
          style: TextStyle( 
            color: Colors.white, 
            fontFamily: "Chivo", 
            fontStyle: FontStyle.italic,
            fontSize: 26
          ) 
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: LinesTab()
    );
  }
  void onTabTapped(int index) {
  setState((){
      _currentIndex = index;
    });
  }
}

