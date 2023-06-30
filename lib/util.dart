  import 'package:intl/intl.dart';
  String formatDate(DateTime? dateTime) {
    if (dateTime == null) return '';

    final dateFormat = DateFormat('dd MMMM yyyy');

    final date = dateFormat.format(dateTime);
   

    return date;
  }
  String formatTime(DateTime? dateTime) {
    if (dateTime == null) return '';

    final timeFormat = DateFormat('hh:mm a');


    final time = timeFormat.format(dateTime);

    return time;
  }
