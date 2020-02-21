import 'package:intl/intl.dart';

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