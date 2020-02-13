import 'package:flutter/material.dart';
import 'lines_tab.dart';

class TeamRoster extends StatelessWidget {

  final TeamLine team;
  TeamRoster( {Key key, @required this.team }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "${team.team}" )
      ),
      body: GridView.count(
        childAspectRatio: 2,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        children: [

          Center ( child: Container(
              child: Text( "LW" )
            ),
          ),
          Center ( child: Container(
              child: Text( "C" )
            ),
          ),
          Center ( child: Container(
              child: Text( "RW" )
            ),
          ),

          Center ( child: Container(
              child: Text( "${team.l1lw}",textAlign: TextAlign.center )
            ),
          ),
          Center ( child: Container(
              child: Text( "${team.l1c}",textAlign: TextAlign.center )
            ),
          ),
          Center ( child: Container(
              child: Text( "${team.l1rw}",textAlign: TextAlign.center )
            ),
          ),
          Center ( child: Container(
              child: Text( "${team.l2lw}",textAlign: TextAlign.center )
            ),
          ),
          Center ( child: Container(
              child: Text( "${team.l2c}",textAlign: TextAlign.center )
            ),
          ),
          Center ( child: Container(
              child: Text( "${team.l2rw}",textAlign: TextAlign.center )
            ),
          ),
          Center ( child: Container(
              child: Text( "${team.l3lw}",textAlign: TextAlign.center )
            ),
          ),
          Center ( child: Container(
              child: Text( "${team.l3c}",textAlign: TextAlign.center )
            ),
          ),
          Center ( child: Container(
              child: Text( "${team.l3rw}",textAlign: TextAlign.center )
            ),
          ),
          Center ( child: Container(
              child: Text( "${team.l4lw}",textAlign: TextAlign.center )
            ),
          ),
          Center ( child: Container(
              child: Text( "${team.l4c}",textAlign: TextAlign.center )
            ),
          ),
          Center ( child: Container(
              child: Text( "${team.l4rw}",textAlign: TextAlign.center )
            ),
          ),
          
        ],
      )
    );
  }



  Column _buildButtonColumn( Color color, IconData icon, String label ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

}

