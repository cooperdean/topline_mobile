import 'package:flutter/material.dart';
import 'lines_tab.dart';

class TeamRoster extends StatelessWidget {

  final TeamLine team;
  TeamRoster( {Key key, @required this.team }) : super(key: key);

  List getTeamColor(String event) {

    if ( event == "Anaheim Ducks" ) return [ Color(0xFFF47A38), Color(0xFF00000) ];
    if ( event == "Arizona Coyotes" ) return [ Color(0xFFE2D6B5), Color(0xFF8C2633) ];
    if ( event == "Boston Bruins" ) return [ Color(0xFFFFB81C), Color(0xFF00000) ];
    if ( event == "Buffalo Sabres" ) return [ Color(0xFFFCB514), Color(0xFF002654) ];
    if ( event == "Calgary Flames" ) return [ Color(0xFFFFFFFF), Color(0xFFC8102E) ];
    if ( event == "Carolina Hurricanes" ) return [ Color(0xFFFFFFFF), Color(0xFFCC0000) ];
    if ( event == "Chicago Blackhawks" ) return [ Color(0xFFFFFFFF), Color(0xFFCF0A2C) ];
    if ( event == "Colorado Avalanche" ) return [ Color(0xFFFFFFFF), Color(0xFF6F263D) ];
    if ( event == "Columbus Blue Jackets" ) return [ Color(0xFFCE1126), Color(0xFF002654) ];
    if ( event == "Dallas Stars" ) return [ Color(0xFF8F8F8C), Color(0xFF006847) ];
    if ( event == "Detriot Red Wings" ) return [ Color(0xFFFFFFFF), Color(0xFFCE1126) ];
    if ( event == "Edmonton Oilers" ) return [ Color(0xFFFF4C00), Color(0xFF041E42) ];
    if ( event == "Florida Panthers" ) return [ Color(0xFFC8102E), Color(0xFF041E42) ];
    if ( event == "Los Angeles Kings" ) return [ Color(0xFFA2AAAD), Color(0xFF111111) ];
    if ( event == "Minnesota Wild" ) return [ Color(0xFFA6192E), Color(0xFF154734) ];
    if ( event == "Montreal Canadiens" ) return [ Color(0xFFAF1E2D), Color(0xFF192168) ];
    if ( event == "Nashville Predators" ) return [ Color(0xFFFFB81C), Color(0xFF041E42) ];
    if ( event == "New Jersey Devils" ) return [ Color(0xFFCE1126), Color(0xFF000000) ];
    if ( event == "New York Islanders" ) return [ Color(0xFFF47D30), Color(0xFF00539B) ];
    if ( event == "New York Rangers" ) return [ Color(0xFFCE1126), Color(0xFF0038A8) ];
    if ( event == "Ottawa Senators" ) return [ Color(0xFFC2912C), Color(0xFFC52032) ];
    if ( event == "Philadelphia Flyers" ) return [ Color(0xFFF74902), Color(0xFF000000) ];
    if ( event == "Pittsburgh Penguins" ) return [ Color(0xFFCFC493), Color(0xFF000000) ];
    if ( event == "San Jose Sharks" ) return [ Color(0xFF006D75), Color(0xFF000000) ];
    if ( event == "St Louis Blues" ) return [ Color(0xFFFCB514), Color(0xFF002F87) ];
    if ( event == "Tampa Bay Lightning" ) return [ Color(0xFFFFFFFF), Color(0xFF002868) ];
    if ( event == "Toronto Maple Leafs" ) return [ Color(0xFFFFFFFF), Color(0xFF00205B) ];
    if ( event == "Vancouver Canucks" ) return [ Color(0xFF00843D), Color(0xFF00205B) ];
    if ( event == "Vegas Golden Knights" ) return [ Color(0xFFB4975A), Color(0xFF333F42) ];
    if ( event == "Washington Capitals" ) return [ Color(0xFFC8102E), Color(0xFF041E42) ];
    if ( event == "Winnipeg Jets" ) return [ Color(0xFF004C97), Color(0xFF041E42) ];
    return [ Colors.black, Colors.white];

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text( "${team.team}", style: TextStyle( color: getTeamColor("${team.team}")[0] ) ),
        backgroundColor: getTeamColor("${team.team}")[1],
      ),
      body: ListView( 
        children: [ 

        GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 2,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          crossAxisCount: 3,
          children: [

          Center ( child: Container( child: Text( "LW",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "C",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "RW",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.l1lw}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.l1c}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.l1rw}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.l2lw}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.l2c}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.l2rw}",textAlign: TextAlign.center ) ), ),          
          Center ( child: Container( child: Text( "${team.l3lw}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.l3c}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.l3rw}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.l4lw}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.l4c}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.l4rw}",textAlign: TextAlign.center ) ), ),        
          
          ],
      )

        ,GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 3.5,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          children: [

          Center ( child: Container( child: Text( "LD" )),),
          Center ( child: Container( child: Text( "RD" )),),

          Center ( child: Container( child: Text( "${team.d1l}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.d1r}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.d2l}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.d2r}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.d3l}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.d3r}",textAlign: TextAlign.center ) ), ),

        ],
      ),
    
        GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 6,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 5,
          crossAxisCount: 1,
          children: [
          
          Center ( child: Container( child: Text( "PP 1" )),),

          Center ( child: Container( child: Text( "${team.pp1lw}   ${team.pp1c}   ${team.pp1rw}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.pp1ld}   ${team.pp1rd}",textAlign: TextAlign.center ) ), ),

        ],
      ),
      
        GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 6,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 5,
          crossAxisCount: 1,
          children: [
          
          Center ( child: Container( child: Text( "PP 1" )),),

          Center ( child: Container( child: Text( "${team.pp2lw}   ${team.pp2c}   ${team.pp2rw}",textAlign: TextAlign.center ) ), ),
          Center ( child: Container( child: Text( "${team.pp2ld}   ${team.pp2rd}",textAlign: TextAlign.center ) ), ),

        ],
      ),
      ]
      )
    );
  }

}