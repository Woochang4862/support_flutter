// ignore_for_file: must_be_immutable

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/utils/extensions.dart';
import 'package:support_flutter/utils/logging/logger.dart';

class DateRangePicker extends StatefulWidget {
  DateRangePicker({
    super.key,
    this.controller,
  });

  DateRangePickerController? controller;

  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  final Map<String, Color> _days = const <String, Color>{
    '일': Color(0xFFFF8888),
    '월': Color(0xFF7C7C7C),
    '화': Color(0xFF7C7C7C),
    '수': Color(0xFF7C7C7C),
    '목': Color(0xFF7C7C7C),
    '금': Color(0xFF7C7C7C),
    '토': Color(0xFF1270B0),
  };

  final headerDateFormat = DateFormat("yyyy년 M월");
  DateTime? _tempDate;
  DateTimeRange? selectedRange;
  DateTime _displayDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.controller?.selectedRange != null) {
      selectedRange = widget.controller?.selectedRange!;
      _displayDate = selectedRange!.start;
    } else if (widget.controller?.selectedDate != null) {
      _tempDate = widget.controller?.selectedDate!;
      _displayDate = _tempDate!;
    } else {
      _tempDate = DateTime.now();
      _displayDate = _tempDate!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 30.h,
              width: 30.w,
              child: Card(
                color: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                elevation: 1.r,
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    addMonth(-1);
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    color: Color.fromARGB(255, 203, 203, 203),
                    size: 18.w,
                  ),
                ),
              ),
            ),
            Text(
              headerDateFormat.format(_displayDate),
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 30.h,
              width: 30.w,
              child: Card(
                color: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                elevation: 1.r,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    addMonth(1);
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.chevron_right,
                    color: Color.fromARGB(255, 203, 203, 203),
                    size: 18.w,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        Divider(
          thickness: 0.5.h,
        ),
        SizedBox(
            height: 38.h,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _days.keys.map((day) {
                return Center(
                  child: Text(
                    day,
                    style: TextStyle(
                      color: _days[day],
                    ),
                  ),
                );
              }).toList(),
            )),
        SizedBox(
          height: 200.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildCalendar(_displayDate, (DateTime selectedDate) {
              if (_tempDate?.equal(selectedDate) ?? false) return;
              setState(() {
                // selectedRange == null && tempDate == null -> tempDate = selectedDate
                // selectedRange == null && tempDate != null -> 날짜 비교해서 selectedRange 생성, tempDate = null
                // selectedRange != null -> selectedRange == null, tempDate = selectedDate
                if (selectedRange == null) {
                  if (_tempDate == null) {
                    _tempDate = selectedDate;
                  } else {
                    if (selectedDate.isGreaterThan(_tempDate!)) {
                      selectedRange =
                          DateTimeRange(start: _tempDate!, end: selectedDate);
                    } else {
                      selectedRange =
                          DateTimeRange(start: selectedDate, end: _tempDate!);
                    }
                    _tempDate = null;
                  }
                } else {
                  _tempDate = selectedDate;
                  selectedRange = null;
                }
                widget.controller?.selectedDate = _tempDate;
                widget.controller?.selectedRange = selectedRange;
                logger.d(selectedRange);
                logger.d(_tempDate);
              });
            }),
          ),
        ),
        Divider(
          thickness: 0.5.h,
        ),
      ],
    );
  }

  void addMonth(int monthToAdd) {
    _displayDate = _displayDate.addDate(monthToAdd: monthToAdd);
  }

  List<Widget> _buildCalendar(
      DateTime date, Function(DateTime selectedDate) onTap) {
    List<Widget> rows = [];
    DateTime firstDateOfMonth = DateTime(date.year, date.month, 1);
    DateTime lastMonth = DateTime(date.year, date.month - 1, 1);
    DateTime lastDateOfMonth = DateTime(date.year, date.month + 1, 0);

    int lastDayOfMonth = lastDateOfMonth.day;
    int lastDayOfLastMonth =
        DateTime(lastMonth.year, lastMonth.month + 1, 0).day;

    int firstWeekday = firstDateOfMonth.weekday % 7; // 0 일요일 -> 6 토요일
    int lastWeekday = lastDateOfMonth.weekday % 7; // 0 일요일 -> 6 토요일
    int lastMonthDay = lastDayOfLastMonth - firstWeekday + 1;
    int currentDay = 1;

    int numberOfWeekOfMonth =
        (lastDayOfMonth - (7 - firstWeekday) - (lastWeekday + 1)) ~/ 7 +
            2; // 첫주와 마지막 주에 몇개의 날이 들어가는지를 빼주고(적어도 2개의 주) 7로 나누어 계산 + 2

    for (int i = 0; i < numberOfWeekOfMonth; i++) {
      List<Widget> days = [];
      for (int j = 0; j < 7; j++) {
        String text;
        Color color;
        DateTime selectedDate;
        if (i == 0 && j < firstWeekday) {
          text = '$lastMonthDay';
          color = Colors.grey;
          selectedDate = DateTime(date.year, date.month - 1, lastMonthDay);
          lastMonthDay++;
        } else if (currentDay > lastDayOfMonth) {
          text = '${currentDay - lastDayOfMonth}';
          color = Colors.grey;
          selectedDate =
              DateTime(date.year, date.month + 1, currentDay - lastDayOfMonth);
          currentDay++;
        } else {
          text = '$currentDay';
          selectedDate = DateTime(date.year, date.month, currentDay);
          color = Colors.black;
          currentDay++;
        }

        if ((selectedRange?.start.equal(selectedDate) ?? false) ||
            (selectedRange?.end.equal(selectedDate) ?? false)) {
          color = mainColor;
        } else if (selectedRange?.contains(selectedDate, closedRange: false) ??
            false) {
          color = accentColor;
        }

        final isStartOfRange =
            selectedRange?.start.equal(selectedDate) ?? false;
        final isEndOfRange = selectedRange?.end.equal(selectedDate) ?? false;
        final isBetween =
            selectedRange?.contains(selectedDate, closedRange: false) ?? false;
        final isTempDate = _tempDate?.equal(selectedDate) ?? false;
        color = isTempDate ? Colors.white : color;

        final frontColor =
            isBetween || isEndOfRange ? accentColor.withAlpha(100) : null;
        final backColor =
            isBetween || isStartOfRange ? accentColor.withAlpha(100) : null;

        days.add(
          Flexible(
            child: Material(
              color: mainColor,
              child: InkWell(
                onTap: () {
                  onTap(selectedDate);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        children: [
                          Flexible(
                              child: Container(
                            height: 24.h,
                            color: frontColor,
                          )),
                          Flexible(
                              child: Container(
                            color: backColor,
                            height: 24.h,
                          )),
                        ],
                      ),
                      Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: isStartOfRange || isEndOfRange || isTempDate
                            ? BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.r)),
                                color: accentColor,
                              )
                            : null,
                        child: Center(
                          child: Text(
                            text,
                            style: TextStyle(color: color),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
      rows.add(Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: days,
        ),
      ));
    }
    return rows;
  }
}

class DateRangePickerController {
  DateTime? _selectedDate;
  DateTimeRange? _selectedRange;

  DateTime? get selectedDate => _selectedDate;
  DateTimeRange? get selectedRange => _selectedRange;

  set selectedDate(DateTime? date) {
    if (_selectedDate?.equal(date) ?? false) {
      return;
    }

    _selectedDate = date;
  }

  set selectedRange(DateTimeRange? range) {
    if (_selectedRange?.equals(range) ?? false) {
      return;
    }

    _selectedRange = range;
  }
}
