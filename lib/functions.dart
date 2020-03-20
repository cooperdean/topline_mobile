import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

String formatDate(String timestamp) {
  DateTime now = DateTime.parse(timestamp);
  DateTime converted = now.toUtc(); 
  return DateFormat('h:mm a - MM/dd').format(converted);
}

bool dateDifference(String timestamp1, String timestamp2) {
  DateTime t1 = DateTime.parse(timestamp1);
  DateTime t2 = DateTime.parse(timestamp2);
  
  if( t1.difference(t2).inDays == 1 )
    return true;
  else
    return false; 
}

String formatDateOnlyTime(String timestamp) {
  DateTime now = DateTime.parse(timestamp);
  DateTime converted = now.toUtc(); 
  return DateFormat('h:mm a').format(converted);
}

String formatDateOnlyDate(String timestamp) {
  DateTime now = DateTime.parse(timestamp);
  DateTime converted = now.toUtc(); 
  return DateFormat('MM/dd a').format(converted);
}

String getTeamLogo(String teamName){

  if ( teamName == "Anaheim Ducks" || teamName == "ANA" ) return "3675" ;
  if ( teamName == "Arizona Coyotes" || teamName == "ARI" ) return "3698" ;
  if ( teamName == "Boston Bruins" || teamName == "BOS" ) return "3677" ;
  if ( teamName == "Buffalo Sabres" || teamName == "BUF" ) return "3678" ;
  if ( teamName == "Calgary Flames" || teamName == "CGY" ) return "3679" ;
  if ( teamName == "Carolina Hurricanes" || teamName == "CAR" ) return "3680" ;
  if ( teamName == "Chicago Blackhawks" || teamName == "CHI" ) return "3681" ;
  if ( teamName == "Colorado Avalanche" || teamName == "COL" ) return "3682" ;
  if ( teamName == "Columbus Blue Jackets" || teamName == "CBJ" ) return "3683" ;
  if ( teamName == "Dallas Stars" || teamName == "DAL" ) return "3684" ;
  if ( teamName == "Detroit Red Wings" || teamName == "DET" ) return "3685" ;
  if ( teamName == "Edmonton Oilers" || teamName == "EDM" ) return "3686" ;
  if ( teamName == "Florida Panthers" || teamName == "FLA" ) return "3687" ;
  if ( teamName == "Los Angeles Kings" || teamName == "LA" ) return "3688" ;
  if ( teamName == "Minnesota Wild" || teamName == "MIN" ) return "3689" ;
  if ( teamName == "Montreal Canadiens" || teamName == "MON" ) return "3690" ;
  if ( teamName == "Nashville Predators" || teamName == "NSH" ) return "3705" ;
  if ( teamName == "New Jersey Devils" || teamName == "NJD" ) return "3704" ;
  if ( teamName == "New York Islanders" || teamName == "NYI" ) return "3703" ;
  if ( teamName == "New York Rangers" || teamName == " NYR" ) return "3701" ;
  if ( teamName == "Ottawa Senators" || teamName == "OTT" ) return "3700" ;
  if ( teamName == "Philadelphia Flyers" || teamName == "PHI" ) return "3699" ;
  if ( teamName == "Pittsburgh Penguins" || teamName == "PIT" ) return "3697" ;
  if ( teamName == "San Jose Sharks" || teamName == "SJS" ) return "3696" ;
  if ( teamName == "St Louis Blues" || teamName == "STL" ) return "3695" ;
  if ( teamName == "Tampa Bay Lightning" || teamName == "TB" ) return "3694" ;
  if ( teamName == "Toronto Maple Leafs" || teamName == "TOR" ) return "3693" ;
  if ( teamName == "Vancouver Canucks" || teamName == "VAN" ) return "3692" ;
  if ( teamName == "Vegas Golden Knights" || teamName == "VEG" ) return "344158" ;
  if ( teamName == "Washington Capitals" || teamName == "WSH" ) return "3691" ;
  if ( teamName == "Winnipeg Jets" || teamName == "WIN" ) return "3676" ;
  return "3686";
}

List getTeamColor(String event) {
  if ( event == "Anaheim Ducks" ) return [ Color(0xFFFFFFFF), Color(0xFFF47A38) ];
  if ( event == "Arizona Coyotes" ) return [ Color(0xFFE2D6B5), Color(0xFF8C2633) ];
  if ( event == "Boston Bruins" ) return [ Color(0xFFFFB81C), Color(0xFF000000) ];
  if ( event == "Buffalo Sabres" ) return [ Color(0xFFFCB514), Color(0xFF002654) ];
  if ( event == "Calgary Flames" ) return [ Color(0xFFF1BE48), Color(0xFFC8102E) ];
  if ( event == "Carolina Hurricanes" ) return [ Color(0xFFFFFFFF), Color(0xFFCC0000) ];
  if ( event == "Chicago Blackhawks" ) return [ Color(0xFFFFFFFF), Color(0xFFCF0A2C) ];
  if ( event == "Colorado Avalanche" ) return [ Color(0xFFFFFFFF), Color(0xFF6F263D) ];
  if ( event == "Columbus Blue Jackets" ) return [ Color(0xFFED3B4D), Color(0xFF002654) ];
  if ( event == "Dallas Stars" ) return [ Color(0xFFFFFFFF), Color(0xFF006847) ];
  if ( event == "Detroit Red Wings" ) return [ Color(0xFFFFFFFF), Color(0xFFCE1126) ];
  if ( event == "Edmonton Oilers" ) return [ Color(0xFFFF4C00), Color(0xFF041E42) ];
  if ( event == "Florida Panthers" ) return [ Color(0xFFFFFFFF), Color(0xFFC8102E) ];
  if ( event == "Los Angeles Kings" ) return [ Color(0xFFFFFFFF), Color(0xFF111111) ];
  if ( event == "Minnesota Wild" ) return [ Color(0xFFDDCBA4), Color(0xFF154734) ];
  if ( event == "Montreal Canadiens" ) return [ Color(0xFFFFFFFF), Color(0xFFAF1E2D) ];
  if ( event == "Nashville Predators" ) return [ Color(0xFFFFB81C), Color(0xFF041E42) ];
  if ( event == "New Jersey Devils" ) return [ Color(0xFFFFFFFF), Color(0xFFCE1126) ];
  if ( event == "New York Islanders" ) return [ Color(0xFFF47D30), Color(0xFF00539B) ];
  if ( event == "New York Rangers" ) return [ Color(0xFFFFFFFF), Color(0xFF0038A8) ];
  if ( event == "Ottawa Senators" ) return [ Color(0xFFC2912C), Color(0xFFC52032) ];
  if ( event == "Philadelphia Flyers" ) return [ Color(0xFF000000) ,Color(0xFFF74902) ];
  if ( event == "Pittsburgh Penguins" ) return [ Color(0xFFFFFFFF), Color(0xFFFCB514) ];
  if ( event == "San Jose Sharks" ) return [ Color(0xFFFFFFFF), Color(0xFF006D75) ];
  if ( event == "St Louis Blues" ) return [ Color(0xFFFCB514), Color(0xFF002F87) ];
  if ( event == "Tampa Bay Lightning" ) return [ Color(0xFFFFFFFF), Color(0xFF002868) ];
  if ( event == "Toronto Maple Leafs" ) return [ Color(0xFFFFFFFF), Color(0xFF00205B) ];
  if ( event == "Vancouver Canucks" ) return [ Color(0xFF00843D), Color(0xFF00205B) ];
  if ( event == "Vegas Golden Knights" ) return [ Color(0xFFB4975A), Color(0xFF333F42) ];
  if ( event == "Washington Capitals" ) return [ Color(0xFF041E42), Color(0xFFC8102E) ];
  if ( event == "Winnipeg Jets" ) return [ Color(0xFF7EC0EE), Color(0xFF041E42) ];
  return [ Colors.black, Colors.white ];
}