import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:topline/paturls.dart';
import 'dart:convert';
import 'functions.dart';

class LineUpdatesTab extends StatefulWidget {
  LineUpdatesTab( {Key key} ) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LineUpdatesState();
}


class _LineUpdatesState extends State<LineUpdatesTab> {

  Future< List<LineUpdate> > _getLineUpdates() async {
    var data = await http.get(lineUpdatesUrl);
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

    return Container(
              child: FutureBuilder(
                future: _getLineUpdates(),
                builder: (BuildContext context, AsyncSnapshot snapshot){

                  if(snapshot.data == null){

                    return Expanded(
                            child: Container( 
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(60),
                                  topLeft: Radius.circular(60),
                                )
                              ),
                              height: 200,
                              child: Center( 
                                child: CircularProgressIndicator()
                              )
                            ),
                          );

                  } else {
                    return Expanded(
                      child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(60),
                                      topLeft: Radius.circular(60),
                                    ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(60),
                                    topLeft: Radius.circular(60)
                                  )
                                ),
                              child: ListView.builder( 
                              itemCount : snapshot.data.length,
                              itemBuilder: (BuildContext context, int index){
                              if( int.tryParse( snapshot.data[index].moved_to.split(" ")[1] ) < 3 ){  
                                  return Container( 
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal:8.0),
                                              child: Card( 
                                                  child: ListTile( 
                                                    leading: Image.network("https://sportteamslogo.com/api?key="+logoKey+"&size=medium&tid="+getTeamLogo("${snapshot.data[index].team}")),
                                                    title: Text( snapshot.data[index].player+" to "+snapshot.data[index].moved_to ),
                                                    subtitle: Text( formatDate( snapshot.data[index].timeStamp ) ),
                                                    trailing: Icon( Icons.arrow_right ),
                                                  ) 
                                                ),
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
                  )
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