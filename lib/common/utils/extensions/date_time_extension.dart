// 📦 Package imports:
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:template_app/common/imports/imports.dart';

extension DateConverter on String {
  String fullDate() {
    final dateTime = DateTime.parse(this);
    final date = DateFormat('yyyy-MM-dd', 'en-us').format(dateTime.toLocal());
    final time = DateFormat('hh:mm', 'en-us').format(dateTime.toLocal());
    final status = DateFormat('a', 'en-us').format(dateTime.toLocal());
    return '($time$status) $date';
  }

  String date() {
    final dateTime = DateTime.parse(this);
    final date =
        DateFormat('EEE d, MMM yyyy', 'en-us').format(dateTime.toLocal());
    return date;
  }

  String time() {
    final dateTime = DateTime.parse(this);
    final time = DateFormat('HH:mm', 'en-us').format(dateTime.toLocal());
    return time;
  }

  String fromTimeSpan() {
    final time = this;
    final timeSplit = time.split(':');
    final converted =
        DateTime(2020, 0, 0, int.parse(timeSplit[0]), int.parse(timeSplit[1]));
    return converted.toString().time();
  }
}

extension DateTimeRangeFormatter on DateTimeRange {
  String formatDateRange() {
    String startDate = DateFormat('yyyy/M/dd', 'en').format(start);
    String endDate = DateFormat('yyyy/M/dd', 'en').format(end);

    return "$startDate  -  $endDate";
  }
}

extension DateTimeExt on DateTime {
  String toDate() {
    return DateFormat('yyyy-MM-dd', 'en-us').format(this);
  }
}
