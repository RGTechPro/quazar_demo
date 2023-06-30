  import 'package:intl/intl.dart';
  String formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return '';

    final dateFormat = DateFormat('dd MMMM yyyy');
    final timeFormat = DateFormat('hh:mm a');

    final date = dateFormat.format(dateTime);
    final time = timeFormat.format(dateTime);

    return '$date, $time';
  }
