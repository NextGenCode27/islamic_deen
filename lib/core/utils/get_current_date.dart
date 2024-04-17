import 'package:intl/intl.dart';

String getCurrentDate({required DateTime now}) {
  // Format the date using DateFormat
  String formattedDate = DateFormat('yyyy-MM-dd').format(now);

  return formattedDate;
}
