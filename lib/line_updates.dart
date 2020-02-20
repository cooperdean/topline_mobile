import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LineUpdatesTab extends StatefulWidget {
  LineUpdatesTab( {Key key} ) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LineUpdatesState();
}


class _LineUpdatesState extends State<LineUpdatesTab> {

  Future<List<LineUpdate>> _getLineUpdates() async {

  var data = await http.get("https://api.myjson.com/bins/195mqg");
  var jsonData = json.decode(data.body);

  List<LineUpdate> lineupdates = [];

  for(var l in jsonData){

    LineUpdate lineupdate = LineUpdate( l["team"], l["player"], l["moved_to"], l["timeStamp"] );
    lineupdates.add(lineupdate);

  }

  return lineupdates;

}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _getLineUpdates(),
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
                      child: Card( child: ListTile( 
                        title: Text( snapshot.data[index].team+" moved "+snapshot.data[index].player+" to "+snapshot.data[index].moved_to ),
                        trailing: Text( snapshot.data[index].timeStamp ),
                        ) )
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

class LineUpdate {

  final String team;
  final String player;
  final String moved_to;
  final String timeStamp;

  LineUpdate( this.team, 
              this.player, 
              this.moved_to, 
              this.timeStamp );

}