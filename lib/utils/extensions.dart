import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:support_flutter/models/profile_model.dart';
import 'package:support_flutter/views/widgets/rounded_dropdown.dart';

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

  bool equals(DateTimeRange? range) {
    if (range == null) {
      return false;
    }

    if (this == range || start.equal(range.start) && end.equal(range.end)) {
      return true;
    }

    return false;
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

  bool equal(DateTime? o) {
    if (o == null) return false;
    return year == o.year && month == o.month && day == o.day;
  }

  bool isGreaterThan(DateTime other) {
    return DateTime(year, month, day)
            .compareTo(DateTime(other.year, other.month, other.day)) >
        0;
  }
}

extension GenderTypeExt on List<GenderType> {
  List<Item> toDropdownItems() {
    return map((e) => (icon: e.icon, label: e.korean)).toList();
  }
}

extension DormTypeExt on List<DormType> {
  List<Item> toDropdownItems() {
    return map((e) => (icon: e.icon, label: e.korean)).toList();
  }
}
