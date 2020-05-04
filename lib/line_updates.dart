import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:topline/paturls.dart';
import 'dart:convert';
import 'functions.dart';

class LineUpdatesTab extends StatefulWidget {
  LineUpdatesTab({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LineUpdatesState();
}

class _LineUpdatesState extends State<LineUpdatesTab> {
  Future<List<LineUpdate>> _getLineUpdates() async {
    var data = await http.get(lineUpdatesUrl);
    var jsonData = json.decode(data.body);

    List<LineUpdate> lineupdates = [];
    for (var l in jsonData) {
      LineUpdate lineupdate = LineUpdate(
          l["team"], l["player"], l["moved_to"], l["timeStamp"], l['promo']);
      lineupdates.add(lineupdate);
    }
    return lineupdates;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: _getLineUpdates(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Expanded(
            child: Container(child: Center(child: CircularProgressIndicator())),
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
                        topLeft: Radius.circular(60))),
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (int.tryParse(
                              snapshot.data[index].movedTo.split(" ")[1]) <
                          3) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey[200], width: 1.0))),
                            child: ListTile(
                                leading: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image.network(
                                        "https://sportteamslogo.com/api?key=" +
                                            logoKey +
                                            "&size=medium&tid=" +
                                            getTeamLogo(
                                                "${snapshot.data[index].team}"))),
                                title: Text(snapshot.data[index].player +
                                    " to " +
                                    snapshot.data[index].movedTo),
                                subtitle: Text(
                                    formatDate(snapshot.data[index].timeStamp)),
                                trailing:
                                    getPromoIcon(snapshot.data[index].promo)),
                          ),
                        );
                      } else {
                        return Container(height: 0, width: 0);
                      }
                    }),
              ),
            ),
          );
        }
      },
    ));
  }
}

class LineUpdate {
  final String team;
  final String player;
  final String movedTo;
  final String timeStamp;
  final String promo;

  LineUpdate(this.team, this.player, this.movedTo, this.timeStamp, this.promo);
}
