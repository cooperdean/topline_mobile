import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:topline/paturls.dart';
import 'dart:convert';
import 'classes/team_rosters.dart';
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
          l["g1"],l["g2"],
          l["record"]

      );
      teamlines.add(teamline);
    }
    return teamlines;
}

  @override
  Widget build(BuildContext context) {

    return Expanded(
          child: FutureBuilder(
          future: _getTeamLines(),
          builder: (BuildContext context, AsyncSnapshot snapshot){

            if(snapshot.data == null){
              return Container(
                child: Center( 
                  child: CircularProgressIndicator()
                )
              );
            } else {
            return ClipRRect(
                borderRadius: BorderRadius.only( 
                  topLeft:Radius.circular(60),
                  topRight: Radius.circular(60) 
                ),
                child: Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.only( 
                    topLeft:Radius.circular(60),
                    topRight: Radius.circular(60) 
                  ),
                  color: Colors.white
                ),
                child: ListView.builder(
                  padding: EdgeInsets.only(top:10),
                  itemCount : snapshot.data.length,
                  itemBuilder: ( BuildContext context, int index){
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left:20.0, right:20.0),
                      child: Container(
                          decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color:Colors.grey[200], width:1.0)
                          )
                        ),
                        child: ListTile(
                          leading: Container(
                            padding: EdgeInsets.all(5),
                            child: Image.network( "https://sportteamslogo.com/api?key="+logoKey+"&size=medium&tid="+getTeamLogo(snapshot.data[index].team))
                          ),
                          title: Text( snapshot.data[index].team, style: TextStyle( fontSize: 18 ) ),
                          subtitle: Text( snapshot.data[index].record ),
                        ),
                      ),
                    ),
                    onTap: () {
                        Navigator.push( context, MaterialPageRoute(builder: (context) => TeamRoster( team: snapshot.data[index] ), ), );
                      },
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    ); 
  }
}