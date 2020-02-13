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

  var data = await http.get("https://api.myjson.com/bins/t789g");
  var jsonData = json.decode(data.body);

  List<LineUpdate> lineupdates = [];

  for(var l in jsonData){

    LineUpdate lineupdate = LineUpdate( l["team_name"], l["prom_line"], l["dem_line"], l["prom_player"], l["dem_player"], l["timestamp"] );
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
                
                if( snapshot.data[index].demLine != 'N/A' && int.parse( snapshot.data[index].promLine.split(' ')[1] ) < 3 ){
                  return Container( 

                    alignment: Alignment.center,
                    child: Card(child: ListTile(

                      title: Text( snapshot.data[index].team+' promoted '+snapshot.data[index].promPlayer+' to '+snapshot.data[index].promLine ),
                      subtitle: Text( 'demoted '+snapshot.data[index].demPlayer+' to '+snapshot.data[index].demLine ),

                      ) 
                    )
                  );
                } else if( snapshot.data[index].promLine == 'INJ' ){
                  return Card( child: ListTile(

                    title: Text( snapshot.data[index].team+' moved '+snapshot.data[index].promPlayer+' to '+snapshot.data[index].promLine ),

                    )
                  );
                } else {
                  return Container(width: 0,height: 0);
                }
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
  final String promLine;
  final String demLine;
  final String promPlayer;
  final String demPlayer;
  final String timeStamp;

  LineUpdate( this.team, 
              this.promLine, 
              this.demLine, 
              this.promPlayer, 
              this.demPlayer,
              this.timeStamp );

}