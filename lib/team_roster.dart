import 'package:flutter/material.dart';
import 'package:topline/widgets/category_selector.dart';
import 'lines_tab.dart';
import 'functions.dart';

class TeamRoster extends StatelessWidget {

  final TeamLine team;
  TeamRoster( {Key key, @required this.team }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: getTeamColor("${team.team}")[1],   
        appBar: AppBar(
          iconTheme: IconThemeData( color: Colors.white ),
            elevation: 0,
            centerTitle: true,
            title: Text( "${team.team}", style: TextStyle( 
              color: Colors.white, 
              fontFamily: "Chivo", 
              fontStyle: FontStyle.italic,
              fontSize: 25.0
            ) 
          ),
          backgroundColor: getTeamColor("${team.team}")[1],
        ),
      body: CategorySelector(team: team)
    );
  }
}