import 'package:intl/intl.dart';

extension DateTimeFormat on DateTime {
  String format(String s) {
    return DateFormat(s).format(this);
  }
}

extension DateTimeEqual on DateTime {
  bool equal(DateTime o) {
    return year == o.year && month == o.month && day == o.day;
  }
}
