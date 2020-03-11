import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'team_roster.dart';

class LinesTab extends StatefulWidget {
  LinesTab( {Key key} ) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LinesState();
}


class _LinesState extends State<LinesTab> {

  Future<List<TeamLine>> _getTeamLines() async {
    var data = await http.get("https://api.myjson.com/bins/12w2fw");
    var jsonData = json.decode( data.body );
    List<TeamLine> teamlines = [];
    for(var l in jsonData){
      TeamLine teamline = TeamLine( 

          l["team"],
          l["ir"],
          l["timestamp"],
          l["l1lw"],
          l["l1c"],
          l["l1rw"],
          l["l2lw"],
          l["l2c"],
          l["l2rw"],
          l["l3lw"],
          l["l3c"],
          l["l3rw"],
          l["l4lw"],
          l["l4c"],
          l["l4rw"],
          l["d1r"],
          l["d1l"],
          l["d2r"],
          l["d2l"],
          l["d3r"],
          l["d3l"],
          l["pp1lw"],
          l["pp1c"],
          l["pp1rw"],
          l["pp1ld"],
          l["pp1rd"],
          l["pp2lw"],
          l["pp2c"],
          l["pp2rw"],
          l["pp2ld"],
          l["pp2rd"]

      );
      teamlines.add(teamline);
    }
    return teamlines;

}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [ 
          
          Container(
            height: 25,
            color: Colors.grey[900]
          ),

          FutureBuilder(
          future: _getTeamLines(),
          builder: (BuildContext context, AsyncSnapshot snapshot){

            if(snapshot.data == null){

              return Container( 
                child: Center( 
                  child: Text("Loading...", style: TextStyle(color: Colors.white) )
                 )
               );

            } else {
              return Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)
                  ),
                  child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                      child: ListView.builder( 
                        itemCount : snapshot.data.length,
                        itemBuilder: ( BuildContext context, int index){
                        return Container( 
                          decoration: BoxDecoration( 
                            color: Colors.white,
                            border: Border(bottom: BorderSide(color: Colors.grey[100] ) )
                            ),
                          child: ListTile(
                            title: Center(
                              child: Text( 
                                snapshot.data[index].team,
                                style: TextStyle( letterSpacing: .4 ),
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
                  ),
                );
              }
            },
          ),
        ]
      ), 
    );
  }
}

class TeamLine {

  final String team;
  final List ir;
  final String timestamp;
  final String l1lw;
  final String l1c;
  final String l1rw;
  final String l2lw;
  final String l2c;
  final String l2rw;
  final String l3lw;
  final String l3c;
  final String l3rw;
  final String l4lw;
  final String l4c;
  final String l4rw;
  final String d1r;
  final String d1l;
  final String d2r;
  final String d2l;
  final String d3r;
  final String d3l;
  final String pp1lw;
  final String pp1c;
  final String pp1rw;
  final String pp1ld; 
  final String pp1rd; 
  final String pp2lw;
  final String pp2c;
  final String pp2rw;
  final String pp2ld;
  final String pp2rd;

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
    this.pp2rd

   );

}