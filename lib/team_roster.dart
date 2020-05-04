import 'package:flutter/material.dart';
import 'package:topline/widgets/category_selector.dart';
import 'classes/team_rosters.dart';
import 'functions.dart';

class TeamRoster extends StatelessWidget {
  final TeamLine team;
  TeamRoster({Key key, @required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            getTeamColor("${team.team}")[1],
            getTeamColor("${team.team}")[0]
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        )),
      ),
      Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0,
            centerTitle: true,
            title: Text("${team.team}",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Chivo",
                    fontStyle: FontStyle.italic,
                    fontSize: 25.0)),
            backgroundColor: Colors.transparent,
          ),
          body: CategorySelector(team: team)),
    ]);
  }
}
