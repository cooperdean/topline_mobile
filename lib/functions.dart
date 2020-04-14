import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

String formatDate(String timestamp) {
  DateTime now = DateTime.parse(timestamp);
  DateTime converted = now.toLocal(); 
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

String getTeamLogo( String teamName ){
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
  if ( teamName == "New York Rangers" || teamName == "NYR" ) return "3701" ;
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
  if ( event == "Anaheim Ducks" ) return [ Color(0xFF7f663a), Color(0xFFB5995A) ];
  if ( event == "Arizona Coyotes" ) return [ Color(0xFF5b101a), Color(0xFF8C2633) ];
  if ( event == "Boston Bruins" ) return [ Color(0xFF000000), Color(0xFF191f21) ];
  if ( event == "Buffalo Sabres" ) return [ Color(0xFF08336b), Color(0xFF002654) ];
  if ( event == "Calgary Flames" ) return [ Color(0xFF840d1f), Color(0xFFC8102E) ];
  if ( event == "Carolina Hurricanes" ) return [ Color(0xFF870202), Color(0xFFCC0000) ];
  if ( event == "Chicago Blackhawks" ) return [ Color(0xFF750e1f), Color(0xFFCF0A2C) ];
  if ( event == "Colorado Avalanche" ) return [ Color(0xFF491224), Color(0xFF6F263D) ];
  if ( event == "Columbus Blue Jackets" ) return [ Color(0xFF001938), Color(0xFF002654) ];
  if ( event == "Dallas Stars" ) return [ Color(0xFF013825), Color(0xFF006847) ];
  if ( event == "Detroit Red Wings" ) return [ Color(0xFFf4182e), Color(0xFFCE1126) ];
  if ( event == "Edmonton Oilers" ) return [ Color(0xFF001126), Color(0xFF041E42) ];
  if ( event == "Florida Panthers" ) return [ Color(0xFF700d1c), Color(0xFFC8102E) ];
  if ( event == "Los Angeles Kings" ) return [ Color(0xFF383838), Color(0xFF828689) ];
  if ( event == "Minnesota Wild" ) return [ Color(0xFF0b261b), Color(0xFF154734) ];
  if ( event == "Montreal Canadiens" ) return [ Color(0xFFcc2435), Color(0xFFAF1E2D) ];
  if ( event == "Nashville Predators" ) return [ Color(0xFF08336b), Color(0xFF041E42) ];
  if ( event == "New Jersey Devils" ) return [ Color(0xFF870202), Color(0xFFCE1126) ];
  if ( event == "New York Islanders" ) return [ Color(0xFF00233f), Color(0xFF003876) ];
  if ( event == "New York Rangers" ) return [ Color(0xFF0649d1), Color(0xFF0038A8) ];
  if ( event == "Ottawa Senators" ) return [ Color(0xFF70131c), Color(0xFFC52032) ];
  if ( event == "Philadelphia Flyers" ) return [ Color(0xFFd33b00) ,Color(0xFFF74902) ];
  if ( event == "Pittsburgh Penguins" ) return [ Color(0xFFa3740e), Color(0xFFFCB514) ];
  if ( event == "San Jose Sharks" ) return [ Color(0xFF053138), Color(0xFF006D75) ];
  if ( event == "St Louis Blues" ) return [ Color(0xFF0047cc), Color(0xFF002F87) ];
  if ( event == "Tampa Bay Lightning" ) return [ Color(0xFF003da0), Color(0xFF002868) ];
  if ( event == "Toronto Maple Leafs" ) return [ Color(0xFF003599), Color(0xFF00205B) ];
  if ( event == "Vancouver Canucks" ) return [ Color(0xFF00205B), Color(0xFF003496) ];
  if ( event == "Vegas Golden Knights" ) return [ Color(0xFF191f21), Color(0xFF333f42) ];
  if ( event == "Washington Capitals" ) return [ Color(0xFF750a1a), Color(0xFFC8102E) ];
  if ( event == "Winnipeg Jets" ) return [ Color(0xFF041E42), Color(0xFF08336b) ];
  return [ Colors.black, Colors.white ];
}

Color getAccentColor(String teamName) {
  if ( teamName == "Anaheim Ducks" ) return Color(0xFFF47A38);
  if ( teamName == "Arizona Coyotes" ) return Color(0xFFE2D6B5);
  if ( teamName == "Boston Bruins" ) return Color(0xFFFFB81C);
  if ( teamName == "Buffalo Sabres" ) return Color(0xFFFCB514);
  if ( teamName == "Calgary Flames" ) return Color(0xFFF1BE48);
  if ( teamName == "Carolina Hurricanes" ) return Color(0xFFFFFFFF);
  if ( teamName == "Chicago Blackhawks" ) return Color(0xFFFFFFFF);
  if ( teamName == "Colorado Avalanche" ) return Color(0xFFFFFFFF);
  if ( teamName == "Columbus Blue Jackets" ) return Color(0xFFCE1126);
  if ( teamName == "Dallas Stars" ) return Color(0xFFFFFFFF);
  if ( teamName == "Detroit Red Wings" ) return Color(0xFFFFFFFF);
  if ( teamName == "Edmonton Oilers" ) return Color(0xFFFF4C00);
  if ( teamName == "Florida Panthers" ) return Color(0xFFFFFFFF);
  if ( teamName == "Los Angeles Kings" ) return Color(0xFFFFFFFF);
  if ( teamName == "Minnesota Wild" ) return Color(0xFFDDCBA4);
  if ( teamName == "Montreal Canadiens" ) return Color(0xFFFFFFFF);
  if ( teamName == "Nashville Predators" ) return Color(0xFFFFB81C);
  if ( teamName == "New Jersey Devils" ) return Color(0xFFFFFFFF);
  if ( teamName == "New York Islanders" ) return Color(0xFFF47D30);
  if ( teamName == "New York Rangers" ) return Color(0xFFCE1126);
  if ( teamName == "Ottawa Senators" ) return Color(0xFFC2912C);
  if ( teamName == "Philadelphia Flyers" ) return Color(0xFFFFFFFF);
  if ( teamName == "Pittsburgh Penguins" ) return Color(0xFFFFFFFF);
  if ( teamName == "San Jose Sharks" ) return Color(0xFFEA7200);
  if ( teamName == "St Louis Blues" ) return Color(0xFFFCB514);
  if ( teamName == "Tampa Bay Lightning" ) return Color(0xFFFFFFFF);
  if ( teamName == "Toronto Maple Leafs" ) return Color(0xFFFFFFFF);
  if ( teamName == "Vancouver Canucks" ) return Color(0xFF00843D);
  if ( teamName == "Vegas Golden Knights" ) return Color(0xFFB4975A);
  if ( teamName == "Washington Capitals" ) return Color(0xFFFFFFFF);
  if ( teamName == "Winnipeg Jets" ) return Color(0xFF004C97);
  return Colors.black;
}

String getTeamAbv(String teamName) {
  if ( teamName == "Anaheim Ducks" ) return "ANA";
  if ( teamName == "Arizona Coyotes" ) return "ARI";
  if ( teamName == "Boston Bruins" ) return "BOS";
  if ( teamName == "Buffalo Sabres" ) return "BUF";
  if ( teamName == "Calgary Flames" ) return "CGY";
  if ( teamName == "Carolina Hurricanes" ) return "CAR";
  if ( teamName == "Chicago Blackhawks" ) return "CHI";
  if ( teamName == "Colorado Avalanche" ) return "COL";
  if ( teamName == "Columbus Blue Jackets" ) return "CBJ";
  if ( teamName == "Dallas Stars" ) return "DAL";
  if ( teamName == "Detroit Red Wings" ) return "DET";
  if ( teamName == "Edmonton Oilers" ) return "EDM";
  if ( teamName == "Florida Panthers" ) return "FLA";
  if ( teamName == "Los Angeles Kings" ) return "LA";
  if ( teamName == "Minnesota Wild" ) return "MIN";
  if ( teamName == "Montreal Canadiens" ) return "MON";
  if ( teamName == "Nashville Predators" ) return "NSH";
  if ( teamName == "New Jersey Devils" ) return "NJD";
  if ( teamName == "New York Islanders" ) return "NYI";
  if ( teamName == "New York Rangers" ) return "NYR";
  if ( teamName == "Ottawa Senators" ) return "OTT";
  if ( teamName == "Philadelphia Flyers" ) return "PHI";
  if ( teamName == "Pittsburgh Penguins" ) return "PIT";
  if ( teamName == "San Jose Sharks" ) return "SJS";
  if ( teamName == "St Louis Blues" ) return "STL";
  if ( teamName == "Tampa Bay Lightning" ) return "TB";
  if ( teamName == "Toronto Maple Leafs" ) return "TOR";
  if ( teamName == "Vancouver Canucks" ) return "VAN";
  if ( teamName == "Vegas Golden Knights" ) return "VEG";
  if ( teamName == "Washington Capitals" ) return "WSH";
  if ( teamName == "Winnipeg Jets" ) return "WIN";
  return "ABV";
}

FaIcon getPromoIcon( String promoString ) {
  if( promoString == 'yes' ) return FaIcon( FontAwesomeIcons.sortUp, color: Colors.greenAccent, );
  if( promoString == 'no' ) return FaIcon( FontAwesomeIcons.sortDown, color: Color(0xFFc8102e) );
  return FaIcon( FontAwesomeIcons.minus, color: Colors.transparent, size:12 );  
}


