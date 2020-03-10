import 'package:flutter/material.dart';

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