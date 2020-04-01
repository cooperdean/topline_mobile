import 'package:flutter/material.dart';
import 'package:topline/widgets/help_page.dart';
import 'lines_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ Color(0xFF131729), Color(0xFF2b345e) ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                )
              ),
            ),

            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
                leading: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20
                  ),
                  child: GestureDetector(
                    onTap: () { Navigator.push( context, MaterialPageRoute(builder: (context) => HelpPage() ) ); },
                    child: FaIcon( FontAwesomeIcons.solidQuestionCircle, color: Colors.white )
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
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              body: LinesTab()
            ),
          ]
    );
  }

}


