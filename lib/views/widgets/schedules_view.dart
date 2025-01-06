// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support_flutter/models/schedules_model.dart';
import 'package:support_flutter/utils/extensions.dart';
import 'package:support_flutter/views/widgets/schedules_simple_view.dart';

class SchedulesView extends ConsumerStatefulWidget {
  SchedulesView({
    super.key,
    required this.displayDate,
    required this.schedules,
    required this.onSelectionChanged,
    required this.onMonthChanged,
  });

  DateTime displayDate;
  final Map<String, List<Schedule>> schedules;
  final Function(DateTime selectedDate) onSelectionChanged;
  final Function(DateTime date) onMonthChanged;

  @override
  _SchedulesViewState createState() => _SchedulesViewState();
}

class _SchedulesViewState extends ConsumerState<SchedulesView> {
  final Map<String, Color> _days = <String, Color>{
    '일': Color(0xFFFF8888),
    '월': Color(0xFF7C7C7C),
    '화': Color(0xFF7C7C7C),
    '수': Color(0xFF7C7C7C),
    '목': Color(0xFF7C7C7C),
    '금': Color(0xFF7C7C7C),
    '토': Color(0xFF1270B0),
  };
  late DateTime _selectedDate;

  @override
  void initState() {
    final now = DateTime.now();
    if (now.year == widget.displayDate.year &&
        now.month == widget.displayDate.month) {
      _selectedDate = DateTime(now.year, now.month, now.day);
    } else {
      _selectedDate =
          DateTime(widget.displayDate.year, widget.displayDate.month, 1);
    }
    super.initState();
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
                color: Colors.white,
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
              widget.displayDate.format('yyyy년 M월'),
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 30.h,
              width: 30.w,
              child: Card(
                color: Colors.white,
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
            children:
                _buildCalendar(widget.displayDate, (DateTime selectedDate) {
              setState(() {
                _selectedDate = selectedDate;
              });
              widget.onSelectionChanged(_selectedDate);
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
    widget.displayDate = widget.displayDate._add(monthToAdd: monthToAdd);
    widget.onMonthChanged(widget.displayDate);

    final now = DateTime.now();
    if (now.year == widget.displayDate.year &&
        now.month == widget.displayDate.month) {
      _selectedDate = DateTime(now.year, now.month, now.day);
    } else {
      _selectedDate =
          DateTime(widget.displayDate.year, widget.displayDate.month, 1);
    }
    widget.onSelectionChanged(_selectedDate);
  }

  List<Widget> _buildCalendar(
      DateTime date, Function(DateTime selectedDate) onTap) {
    List<Widget> rows = [];
    DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);
    DateTime lastMonth = DateTime(date.year, date.month - 1, 1);

    int lastDayOfMonth = DateTime(date.year, date.month + 1, 0).day;
    int lastDayOfLastMonth =
        DateTime(lastMonth.year, lastMonth.month + 1, 0).day;

    int firstWeekday = firstDayOfMonth.weekday;
    int lastMonthDay = lastDayOfLastMonth - firstWeekday + 2;
    int currentDay = 1;

    for (int i = 0; i < (lastDayOfMonth ~/ 7 + 1); i++) {
      List<Widget> days = [];
      for (int j = 0; j < 7; j++) {
        String text;
        Color color;
        DateTime selectedDate;
        if (i == 0 && j < firstWeekday - 1) {
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
          final now = DateTime.now();
          selectedDate = DateTime(date.year, date.month, currentDay);
          if (currentDay == now.day &&
              date.month == now.month &&
              date.year == now.year &&
              !_selectedDate.equal(selectedDate)) {
            color = Color(0xFFF49446);
          } else {
            color = Colors.black;
          }
          currentDay++;
        }

        if (_selectedDate.equal(selectedDate)) {
          color = Colors.white;
        }

        days.add(
          Flexible(
            child: InkWell(
              onTap: () {
                onTap(selectedDate);
              },
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      decoration: _selectedDate.equal(selectedDate)
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFF49446),
                            )
                          : null,
                      child: Center(
                        child: Text(
                          text,
                          style: TextStyle(color: color),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: SchedulesSimpleView(
                      schedules:
                          widget.schedules[selectedDate.format('yyyy-MM-dd')] ??
                              [],
                    ),
                  ),
                ],
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

extension AddDate on DateTime {
  DateTime _add({
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
}
