import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'functions.dart';
import 'package:intl/intl.dart';

class LineUpdatesTab extends StatefulWidget {
  LineUpdatesTab( {Key key} ) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LineUpdatesState();
}


class _LineUpdatesState extends State<LineUpdatesTab> {

  Future<List<LineUpdate>> _getLineUpdates() async {

  var data = await http.get("https://api.myjson.com/bins/xwge4");
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
      backgroundColor: Colors.grey[900],
      body: Column(
          children: [ 
            Container(
              height: 25,
              color: Colors.grey[900]
            ),
            Container(
              child: FutureBuilder(
                future: _getLineUpdates(),
                builder: (BuildContext context, AsyncSnapshot snapshot){

                  if(snapshot.data == null){

                    return Container( 
                      child: Center( 
                        child: Text("Loading...", style: TextStyle( color: Colors.white ) )
                      )
                    );

                  } else {
                    return Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)
                        ),
                        child: Container(

                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              )

                            ),


                            child: ListView.builder( 

                            itemCount : snapshot.data.length,
                            itemBuilder: (BuildContext context, int index){

                            if( int.tryParse( snapshot.data[index].moved_to.split(" ")[1] ) < 3 ){  
                                return Container( 
                                  child: Card( 
                                      child: Container(
                                        color: Colors.white,
                                        child: ListTile( 
                                          title: Center( child: Text( snapshot.data[index].team+" moved "+snapshot.data[index].player+" to "+snapshot.data[index].moved_to ) ),
                                          subtitle: Center( child: Text( formatDate( snapshot.data[index].timeStamp ) ) ),
                                        ),
                                      ) 
                                  )
                                );
                            } else {
                                return Container( height: 0, width: 0 );
                            }

                            }
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
        ]
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