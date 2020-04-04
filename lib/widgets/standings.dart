import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:topline/classes/standings_team.dart';
import 'package:topline/paturls.dart';

import '../functions.dart';

class LeagueStandings extends StatefulWidget {
  @override
  _LeagueStandingsState createState() => _LeagueStandingsState();
}

class _LeagueStandingsState extends State<LeagueStandings> {

  Future< List<StandingsTeam> > _getStandingsTeam() async {
    var data = await http.get(standingsUrl);
    var jsonData = json.decode(data.body);

    List<StandingsTeam> teamStandings = [];
    for(var l in jsonData){
        StandingsTeam teamStanding = StandingsTeam( 
          l["W"],
          l["L"],
          l["OTL"],
          l["Pts"],
          l["GP"],
          l["ROW"],
          l["SOW"],
          l["SOL"],
          l["GF"],
          l["GA"],
          l["GD"],
          l["Home"],
          l["Away"],
          l["L10"],
          l["Strk"],
          l["Team"],
          l["Conf"]
        );
        teamStandings.add(teamStanding);
      }
    return teamStandings;

    }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _getStandingsTeam(),
        builder: (BuildContext context, AsyncSnapshot snapshot){

          if(snapshot.data == null){

            return Expanded(
                child: Container( 
                  child: Center( 
                    child: CircularProgressIndicator()
                  )
                ),
              );

          } else {

            return Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    )
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.all(20),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index){
                        if( index==0 ) {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only( top:10, bottom:30 ),
                                child: Text("Eastern Conference", style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ) ),
                              ),
                              Container(
                                child: Row (
                                  children: [ 
                                    Container(
                                      padding: EdgeInsets.all(14.0),
                                      child: SizedBox(width:15),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text("-"),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text( "GP", 
                                        style: TextStyle( fontWeight: FontWeight.bold ), 
                                        textAlign: TextAlign.center, )
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text( "Record", 
                                        style: TextStyle( fontWeight: FontWeight.bold ), 
                                        textAlign: TextAlign.center, )
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text( "L10", 
                                        style: TextStyle( fontWeight: FontWeight.bold ), 
                                        textAlign: TextAlign.center, )
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox()
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FaIcon( FontAwesomeIcons.fireAlt )
                                    ),
                                  ]
                                ),
                              ),
                              Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  border: index != 30 ? Border( bottom: BorderSide( color: Colors.grey[200], width: 1 ) ) : Border()
                                ),
                                child: Row (
                                  children: [ 
                                    Container(
                                      padding: EdgeInsets.all(14.0),
                                      child: Image.network("https://sportteamslogo.com/api?key="+logoKey+"&size=medium&tid="+getTeamLogo("${snapshot.data[index].team}"))
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text( getTeamAbv( snapshot.data[index].team ) )
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text( snapshot.data[index].gp )
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text( "${snapshot.data[index].wins}-${snapshot.data[index].losses}-${snapshot.data[index].otLosses} ")
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text( snapshot.data[index].lastTen )
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox()
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text( 
                                        snapshot.data[index].streak,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: snapshot.data[index].streak[0] == 'W' ? Colors.greenAccent : Color(0xFFc8102e)
                                        ),
                                      )
                                    ),
                                  ]
                                ),
                              )
                            ],
                          );
                        }
                        if( index==16 ) {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only( top:35, bottom:30 ),
                                child: Text("Western Conference", style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ) ),
                              ),
                              Container(
                                child: Row (
                                  children: [ 
                                    Container(
                                      padding: EdgeInsets.all(14.0),
                                      child: SizedBox(width:15),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text("-"),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text( "GP", 
                                        style: TextStyle( fontWeight: FontWeight.bold ), 
                                        textAlign: TextAlign.center, )
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text( "Record", 
                                        style: TextStyle( fontWeight: FontWeight.bold ), 
                                        textAlign: TextAlign.center, )
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text( "L10", 
                                        style: TextStyle( fontWeight: FontWeight.bold ), 
                                        textAlign: TextAlign.center, )
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox()
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FaIcon( FontAwesomeIcons.fireAlt )
                                    ),
                                  ]
                                ),
                              ),
                              Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  border: index != 30 ? Border( bottom: BorderSide( color: Colors.grey[200], width: 1 ) ) : Border()
                                ),
                                child: Row (
                                  children: [ 
                                    Container(
                                      padding: EdgeInsets.all(14.0),
                                      child: Image.network("https://sportteamslogo.com/api?key="+logoKey+"&size=medium&tid="+getTeamLogo("${snapshot.data[index].team}"))
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text( getTeamAbv( snapshot.data[index].team ) )
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text( snapshot.data[index].gp )
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text( "${snapshot.data[index].wins}-${snapshot.data[index].losses}-${snapshot.data[index].otLosses} ")
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text( snapshot.data[index].lastTen )
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox()
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text( 
                                        snapshot.data[index].streak,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: snapshot.data[index].streak[0] == 'W' ? Colors.greenAccent : Color(0xFFc8102e)
                                        ),
                                      )
                                    ),
                                  ]
                                ),
                              )
                            ],
                          );
                        }
                        return Container(
                          height: 60,
                          decoration: BoxDecoration(
                            border: index != 30 ? Border( bottom: BorderSide( color: Colors.grey[200], width: 1 ) ) : Border()
                          ),
                          child: Row (
                            children: [ 
                              Container(
                                padding: EdgeInsets.all(14.0),
                                child: Image.network("https://sportteamslogo.com/api?key="+logoKey+"&size=medium&tid="+getTeamLogo("${snapshot.data[index].team}"))
                              ),
                              Expanded(
                                flex: 1,
                                child: Text( getTeamAbv( snapshot.data[index].team ) )
                              ),
                              Expanded(
                                flex: 1,
                                child: Text( snapshot.data[index].gp )
                              ),
                              Expanded(
                                flex: 2,
                                child: Text( "${snapshot.data[index].wins}-${snapshot.data[index].losses}-${snapshot.data[index].otLosses} ")
                              ),
                              Expanded(
                                flex: 1,
                                child: Text( snapshot.data[index].lastTen )
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox()
                              ),
                              Expanded(
                                flex: 1,
                                child: Text( 
                                  snapshot.data[index].streak,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: snapshot.data[index].streak[0] == 'W' ? Colors.greenAccent : Color(0xFFc8102e)
                                  ),
                                )
                              ),
                            ]
                          ),
                        );
                      }
                  ),
                ),
              ),
            );
          }
        }
      )
    );
  }
}