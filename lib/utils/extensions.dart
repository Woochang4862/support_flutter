import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeRangeExt on DateTimeRange {
  bool contains(DateTime date, {bool closedRange = true}) {
    if (closedRange) {
      return !start.isGreaterThan(date) && end.isGreaterThan(date);
    } else {
      return !start.equal(date) &&
          !end.equal(date) &&
          !start.isGreaterThan(date) &&
          end.isGreaterThan(date);
    }
  }
}

extension DateTimeExt on DateTime {
  String format(String s) {
    return DateFormat(s).format(this);
  }

  DateTime addDate({
    int monthToAdd = 0,
    int yearToAdd = 0,
    int dayToAdd = 0,
  }) {
    return DateTime(
      year,
      month + monthToAdd,
      day,
    );
  }

  bool equal(DateTime o) {
    return year == o.year && month == o.month && day == o.day;
  }

  bool isGreaterThan(DateTime other) {
    return DateTime(year, month, day)
            .compareTo(DateTime(other.year, other.month, other.day)) >
        0;
  }
}
