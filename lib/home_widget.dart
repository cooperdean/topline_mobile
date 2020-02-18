import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
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
    PlaceholderWidget(Colors.green)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Image.asset( 'assets/topsix_logo.png', fit: BoxFit.cover, height: 30 ),
        backgroundColor: Colors.white,
        ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.playlist_add_check),
            title: new Text('Lines')
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.update),
            title: new Text('Line Updates')
          ),          
        ],
      ),
    );
  }
  void onTabTapped(int index) {
  setState((){
      _currentIndex = index;
    });
  }
}

