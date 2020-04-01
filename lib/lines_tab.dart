import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:topline/line_updates.dart';
import 'package:topline/paturls.dart';
import 'dart:convert';
import 'functions.dart';
import 'team_roster.dart';

class LinesTab extends StatefulWidget {
  LinesTab( {Key key} ) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LinesState();
}


class _LinesState extends State<LinesTab> {

  Future<List<TeamLine>> _getTeamLines() async {
    var data = await http.get(linesUrl);
    var jsonData = json.decode( utf8.decode( data.bodyBytes) );
    List<TeamLine> teamlines = [];
    for(var l in jsonData){
      TeamLine teamline = TeamLine( 

          l["team"],
          l["ir"],
          l["timestamp"],
          l["l1lw"], l["l1c"], l["l1rw"],
          l["l2lw"],l["l2c"],l["l2rw"],
          l["l3lw"],l["l3c"],l["l3rw"],
          l["l4lw"],l["l4c"],l["l4rw"],
          l["d1r"],l["d1l"],
          l["d2r"],l["d2l"],
          l["d3r"],l["d3l"],
          l["pp1lw"],l["pp1c"],l["pp1rw"],
          l["pp1ld"],l["pp1rd"],
          l["pp2lw"],l["pp2c"],l["pp2rw"],
          l["pp2ld"],l["pp2rd"],
          l["g1"],l["g2"]

      );
      teamlines.add(teamline);
    }
    return teamlines;

}

  @override
  Widget build(BuildContext context) {

    final List<String> pageCats = ['Rosters & Schedules'];
    int selectedIndex = 0;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [         
            Container(
              height: 60,
              color: Colors.transparent,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pageCats.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState( () {
                        selectedIndex = index;
                        print(selectedIndex);
                        }
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 14.0
                      ),
                      child: Text(
                        pageCats[index],
                        style: TextStyle(
                          color: index == selectedIndex ? Colors.white : Colors.white38,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1
                        )
                      )
                    ),
                  );
                }
              )
            ),

          FutureBuilder(
          future: _getTeamLines(),
          builder: (BuildContext context, AsyncSnapshot snapshot){

            if(snapshot.data == null){

              return Container( 
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: ( 
                    BorderRadius.all( Radius.circular(60) ) 
                  )
                ),
                height: 210,
                child: Center( 
                  child: CircularProgressIndicator()
                )
              );

            } else {
              return ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    child: Column(
                        children: [ 
                          Container(
                            height: 210,
                            decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: GridView.builder(
                              padding: EdgeInsets.all( 8.0 ),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 6,
                              ),
                              itemCount : snapshot.data.length,
                              itemBuilder: ( BuildContext context, int index){
                              return Container( 
                                padding: EdgeInsets.only(
                                  top: 13,
                                  left: 13,
                                  right: 13,
                                ),
                                decoration: BoxDecoration( 
                                  color: Colors.white,
                                  ),
                                child: GestureDetector(
                                  child: Container(
                                    child: Column(
                                        children: [ 
                                          Image.network( "https://sportteamslogo.com/api?key="+logoKey+"&size=medium&tid="+getTeamLogo("${snapshot.data[index].team}" ) ),
                                        ]
                                    ) 
                                  ),
                                  onTap: () {
                                      Navigator.push( context, MaterialPageRoute(builder: (context) => TeamRoster( team: snapshot.data[index] ), ), );
                                    },
                                  ) 
                                );
                              },
                            ),
                          ),
                        ]
                      ),
                    );
                  }
                },
              ),
            Container( 
              height: 60, 
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center ( child: 
                    Container( child: 
                      Padding(
                        padding: EdgeInsets.only(left:20),
                        child: Text( 
                          "Line Updates", 
                          style: TextStyle(
                            color: Colors.white, 
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1
                          ) 
                        ),
                      ) 
                    ), 
                  ),
                ],
              )
            ),
          LineUpdatesTab()
        ]
      ), 
    );
  }
}

class TeamLine {

  final String team;
  final List ir;
  final String timestamp;
  final List l1lw;
  final List l1c;
  final List l1rw;
  final List l2lw;
  final List l2c;
  final List l2rw;
  final List l3lw;
  final List l3c;
  final List l3rw;
  final List l4lw;
  final List l4c;
  final List l4rw;
  final List d1r;
  final List d1l;
  final List d2r;
  final List d2l;
  final List d3r;
  final List d3l;
  final List pp1lw;
  final List pp1c;
  final List pp1rw;
  final List pp1ld; 
  final List pp1rd; 
  final List pp2lw;
  final List pp2c;
  final List pp2rw;
  final List pp2ld;
  final List pp2rd;
  final List g1;
  final List g2;
  
  TeamLine( 

    this.team,
    this.ir,
    this.timestamp,
    this.l1lw,
    this.l1c,
    this.l1rw,
    this.l2lw,
    this.l2c,
    this.l2rw,
    this.l3lw,
    this.l3c,
    this.l3rw,
    this.l4lw,
    this.l4c,
    this.l4rw,
    this.d1r,
    this.d1l,
    this.d2r,
    this.d2l,
    this.d3r,
    this.d3l,
    this.pp1lw,
    this.pp1c,
    this.pp1rw,
    this.pp1ld,
    this.pp1rd,
    this.pp2lw,
    this.pp2c,
    this.pp2rw,
    this.pp2ld,
    this.pp2rd,
    this.g1,
    this.g2,

   );

}

class TeamSchedule {

  final String gameNumber;
  final String date;
  final String homeAway;
  final String opponent;
  final String goalsFor;
  final String goalsAgainst;
  final String result;
  final String overtime;

  TeamSchedule(
    this.gameNumber,
    this.date,
    this.homeAway,
    this.opponent,
    this.goalsFor,
    this.goalsAgainst,
    this.result,
    this.overtime
  );

}