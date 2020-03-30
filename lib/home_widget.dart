import 'package:flutter/material.dart';
import 'package:topline/widgets/help_page.dart';
import 'line_updates.dart';
import 'lines_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final List<Widget> _children = [
    LinesTab(),
    LineUpdatesTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20
          ),
          child: GestureDetector(
            onTap: () { Navigator.push( context, MaterialPageRoute(builder: (context) => HelpPage() ) ); },
            child: FaIcon( FontAwesomeIcons.solidQuestionCircle )
            ),
        ),
        title: Text( "TopSix", 
          style: TextStyle( 
            color: Colors.white, 
            fontFamily: "Chivo", 
            fontStyle: FontStyle.italic,
            fontSize: 40
          ) 
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: LinesTab()
    );
  }

}


