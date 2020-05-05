import 'package:flutter/material.dart';
import 'package:topline/paturls.dart';
import 'classes/team_rosters.dart';
import 'functions.dart';
import 'team_roster.dart';
import 'package:firebase_database/firebase_database.dart';

class LinesTab extends StatefulWidget {
  LinesTab({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LinesState();
}

class _LinesState extends State<LinesTab> {
  TeamLine _getTeamLines(dynamic teamlist) {
    return TeamLine(
        teamlist["team"],
        teamlist["ir"],
        teamlist["timestamp"],
        teamlist["l1lw"],
        teamlist["l1c"],
        teamlist["l1rw"],
        teamlist["l2lw"],
        teamlist["l2c"],
        teamlist["l2rw"],
        teamlist["l3lw"],
        teamlist["l3c"],
        teamlist["l3rw"],
        teamlist["l4lw"],
        teamlist["l4c"],
        teamlist["l4rw"],
        teamlist["d1r"],
        teamlist["d1l"],
        teamlist["d2r"],
        teamlist["d2l"],
        teamlist["d3r"],
        teamlist["d3l"],
        teamlist["pp1lw"],
        teamlist["pp1c"],
        teamlist["pp1rw"],
        teamlist["pp1ld"],
        teamlist["pp1rd"],
        teamlist["pp2lw"],
        teamlist["pp2c"],
        teamlist["pp2rw"],
        teamlist["pp2ld"],
        teamlist["pp2rd"],
        teamlist["g1"],
        teamlist["g2"]);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseDatabase.instance.reference().child('Teams').onValue,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(child: Center(child: CircularProgressIndicator()));
          } else {
            Map data = snapshot.data.snapshot.value;
            List teams = [];
            data.forEach((index, data) => teams.add({"team": index, ...data}));
            return ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60), topRight: Radius.circular(60)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                    color: Colors.white),
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10),
                  itemCount: teams.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                                        getTeamLogo(teams[index]['team']))),
                            title: Text(teams[index]['team'],
                                style: TextStyle(fontSize: 16)),
                            subtitle: Text(teams[index]['timestamp']),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TeamRoster(team: _getTeamLines(teams[index])),
                          ),
                        );
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
