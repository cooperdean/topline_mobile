import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LinesTab extends StatefulWidget {
  LinesTab( {Key key} ) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LinesState();
}


class _LinesState extends State<LinesTab> {

  Future<List<TeamLine>> _getTeamLines() async {

  var data = await http.get("https://api.myjson.com/bins/kgp1c");
  var jsonData = json.decode(data.body);

  List<TeamLine> teamlines = [];

  for(var l in jsonData){

    TeamLine teamline = TeamLine( 

        l["team"],
        l["ir"],
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

     );
    teamlines.add(teamline);
  }

  return teamlines;

}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _getTeamLines(),
          builder: (BuildContext context, AsyncSnapshot snapshot){

            if(snapshot.data == null){

              return Container( 
                child: Center( 
                  child: Text("Loading...")
                 )
               );

            } else {
              return ListView.builder( 

                itemCount : snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                return Container( 

                    alignment: Alignment.center,
                    child: Card(child: ListTile(

                      title: Center(
                        child: Text( snapshot.data[index].team ),
                      )
                      ) 
                    )
                  );

                },
              );
            }
          },
        ),
      ), 
    );
  }
}

class TeamLine {

  final String team;
  final List ir;
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

  TeamLine( 

    this.team,
    this.ir,
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

   );

}