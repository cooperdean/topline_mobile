import 'package:flutter/material.dart';
import 'lines_tab.dart';
import 'functions.dart';

class TeamRoster extends StatelessWidget {

  final TeamLine team;
  TeamRoster( {Key key, @required this.team }) : super(key: key);

  List getTeamColor(String event) {
    if ( event == "Anaheim Ducks" ) return [ Color(0xFF00685E), Color(0xFF532A44) ];
    if ( event == "Arizona Coyotes" ) return [ Color(0xFFE2D6B5), Color(0xFF8C2633) ];
    if ( event == "Boston Bruins" ) return [ Color(0xFFFFB81C), Color(0xFF000000) ];
    if ( event == "Buffalo Sabres" ) return [ Color(0xFFFCB514), Color(0xFF002654) ];
    if ( event == "Calgary Flames" ) return [ Color(0xFFF1BE48), Color(0xFFC8102E) ];
    if ( event == "Carolina Hurricanes" ) return [ Color(0xFFFFFFFF), Color(0xFFCC0000) ];
    if ( event == "Chicago Blackhawks" ) return [ Color(0xFFFFFFFF), Color(0xFFCF0A2C) ];
    if ( event == "Colorado Avalanche" ) return [ Color(0xFF236192), Color(0xFF6F263D) ];
    if ( event == "Columbus Blue Jackets" ) return [ Color(0xFFCE1126), Color(0xFF002654) ];
    if ( event == "Dallas Stars" ) return [ Color(0xFFFFFFFF), Color(0xFF006847) ];
    if ( event == "Detroit Red Wings" ) return [ Color(0xFFFFFFFF), Color(0xFFCE1126) ];
    if ( event == "Edmonton Oilers" ) return [ Color(0xFFFF4C00), Color(0xFF041E42) ];
    if ( event == "Florida Panthers" ) return [ Color(0xFFC8102E), Color(0xFF041E42) ];
    if ( event == "Los Angeles Kings" ) return [ Color(0xFFFFFFFF), Color(0xFF111111) ];
    if ( event == "Minnesota Wild" ) return [ Color(0xFFDDCBA4), Color(0xFF154734) ];
    if ( event == "Montreal Canadiens" ) return [ Color(0xFFFFFFFF), Color(0xFFAF1E2D) ];
    if ( event == "Nashville Predators" ) return [ Color(0xFFFFB81C), Color(0xFF041E42) ];
    if ( event == "New Jersey Devils" ) return [ Color(0xFFCE1126), Color(0xFF000000) ];
    if ( event == "New York Islanders" ) return [ Color(0xFFF47D30), Color(0xFF00539B) ];
    if ( event == "New York Rangers" ) return [ Color(0xFFFFFFFF), Color(0xFF0038A8) ];
    if ( event == "Ottawa Senators" ) return [ Color(0xFFC2912C), Color(0xFFC52032) ];
    if ( event == "Philadelphia Flyers" ) return [ Color(0xFF000000) ,Color(0xFFF74902) ];
    if ( event == "Pittsburgh Penguins" ) return [ Color(0xFFCFC493), Color(0xFF000000) ];
    if ( event == "San Jose Sharks" ) return [ Color(0xFF000000), Color(0xFF006D75) ];
    if ( event == "St Louis Blues" ) return [ Color(0xFFFCB514), Color(0xFF002F87) ];
    if ( event == "Tampa Bay Lightning" ) return [ Color(0xFFFFFFFF), Color(0xFF002868) ];
    if ( event == "Toronto Maple Leafs" ) return [ Color(0xFFFFFFFF), Color(0xFF00205B) ];
    if ( event == "Vancouver Canucks" ) return [ Color(0xFF00843D), Color(0xFF00205B) ];
    if ( event == "Vegas Golden Knights" ) return [ Color(0xFF333F42), Color(0xFFB4975A) ];
    if ( event == "Washington Capitals" ) return [ Color(0xFFC8102E), Color(0xFF041E42) ];
    if ( event == "Winnipeg Jets" ) return [ Color(0xFF004C97), Color(0xFF041E42) ];
    return [ Colors.black, Colors.white ];
  }
  final List<String> lineCats = ['Forwards', 'Defense', 'Powerplay 1', 'Powerplay 2'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: getTeamColor("${team.team}")[1],   
        appBar: AppBar(
        iconTheme: IconThemeData( color: Colors.white ),
        elevation: 0,
        centerTitle: true,
        title: Text( "${team.team}", style: TextStyle( 
          color: Colors.white, 
          fontFamily: "Chivo", 
          fontStyle: FontStyle.italic,
          fontSize: 25.0
        ) ),
        backgroundColor: getTeamColor("${team.team}")[1],
      ),
      body: Column(
          children: [ 
            Container(
              height: 60,
              color: getTeamColor("${team.team}")[1],

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: lineCats.length,
                itemBuilder: (BuildContext context,int index) {

                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 12.0
                    ),
                    child: Text(
                      lineCats[index],
                      style: TextStyle(
                        fontFamily: 'Chivo',
                        color: index == selectedIndex ? getTeamColor("${team.team}")[0] : Colors.white60,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.4
                      )
                    )
                  );

                }
              
              )

            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                ),
                child: ListView( 
                  children: [
                      Container( 
                        padding: EdgeInsets.only( top:30 ),
                        child: Column( 
                          children: [
                            Icon( Icons.update ),
                            Center( child: Text( "${formatDate(team.timestamp)}" ) ) 
                          ]
                        )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding( padding: EdgeInsets.only( top: 100 ), ),
                          Expanded( child: Divider( color: Colors.grey ) ),
                          Center ( child: Container( child: Text( "LW",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                          Expanded( child: Divider( color: Colors.grey ) ),
                          Center ( child: Container( child: Text( "C",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 )  ) ), ),
                          Expanded( child: Divider( color: Colors.grey ) ),
                          Center ( child: Container( child: Text( "RW",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                          Expanded( child: Divider( color: Colors.grey ) ),
                        ],
                      ),
                      GridView.count(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        childAspectRatio: 2,
                        padding: const EdgeInsets.symmetric( horizontal: 20 ),
                        crossAxisSpacing: 10,
                        crossAxisCount: 3,
                        children: [
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding( padding: EdgeInsets.only( top: 100 ), ),
                          Expanded( child: Divider( color: Colors.grey ) ),
                          Center ( child: Container( child: Text( "LD",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                          Expanded( child: Divider( color: Colors.grey ) ),
                          Center ( child: Container( child: Text( "RD",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 )  ) ), ),
                          Expanded( child: Divider( color: Colors.grey ) ),
                        ],
                      ),
                      GridView.count(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        childAspectRatio: 3.5,
                        padding: const EdgeInsets.symmetric( horizontal: 20 ),
                        crossAxisSpacing: 5,
                        crossAxisCount: 2,
                        children: [
                          Center ( child: Container( child: Text( "${team.d1l}",textAlign: TextAlign.center ) ), ),
                          Center ( child: Container( child: Text( "${team.d1r}",textAlign: TextAlign.center ) ), ),
                          Center ( child: Container( child: Text( "${team.d2l}",textAlign: TextAlign.center ) ), ),
                          Center ( child: Container( child: Text( "${team.d2r}",textAlign: TextAlign.center ) ), ),
                          Center ( child: Container( child: Text( "${team.d3l}",textAlign: TextAlign.center ) ), ),
                          Center ( child: Container( child: Text( "${team.d3r}",textAlign: TextAlign.center ) ), ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding( padding: EdgeInsets.only( top: 100 ), ),
                          Expanded( child: Divider( color: Colors.grey ) ),
                          Center ( child: Container( child: Text( "PP 1",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                          Expanded( child: Divider( color: Colors.grey ) ),
                        ],
                      ),
                      GridView.count(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        childAspectRatio: 6,
                        padding: const EdgeInsets.symmetric( horizontal: 0 ),
                        crossAxisSpacing: 5,
                        crossAxisCount: 1,
                        children: [
                          Center ( child: Container( child: Text( "${team.pp1lw}   ${team.pp1c}   ${team.pp1rw}",textAlign: TextAlign.center ) ), ),
                          Center ( child: Container( child: Text( "${team.pp1ld}   ${team.pp1rd}",textAlign: TextAlign.center ) ), ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding( padding: EdgeInsets.only( top: 100 ), ),
                          Expanded( child: Divider( color: Colors.grey ) ),
                          Center ( child: Container( child: Text( "PP 2",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                          Expanded( child: Divider( color: Colors.grey ) ),
                        ],
                      ),
                      GridView.count(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        childAspectRatio: 6,
                        padding: const EdgeInsets.symmetric( horizontal: 0 ),
                        crossAxisSpacing: 5,
                        crossAxisCount: 1,
                        children: [
                          Center ( child: Container( child: Text( "${team.pp2lw}   ${team.pp2c}   ${team.pp2rw}",textAlign: TextAlign.center ) ), ),
                          Center ( child: Container( child: Text( "${team.pp2ld}   ${team.pp2rd}",textAlign: TextAlign.center ) ), ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding( padding: EdgeInsets.only( top: 100 ), ),
                          Expanded( child: Divider( color: Colors.grey ) ),
                          Center ( child: Container( child: Text( "Out",textAlign: TextAlign.center, style: TextStyle( fontSize: 20 ) ) ), ),
                          Expanded( child: Divider( color: Colors.grey ) ),
                        ],
                      ),
                      GridView.count(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        childAspectRatio: 3.5,
                        padding: const EdgeInsets.symmetric( horizontal: 20 ),
                        crossAxisSpacing: 5,
                        crossAxisCount: 2,
                        children: [
                          for (var ir in team.ir) Center( child: Text( "${ir}" ) )
                        ],
                      ),
                      Container( height: 100 )
                  ]
                ),
              ),
            ),
          ]
      )
    );
  }
}