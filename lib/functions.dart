import 'package:intl/intl.dart';

String formatDate(String timestamp) {
  DateTime now = DateTime.parse(timestamp);
  DateTime converted = now.toUtc(); 
  return DateFormat('h:mm a - MM/dd').format(converted);
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