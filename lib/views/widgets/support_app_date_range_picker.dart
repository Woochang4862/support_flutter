import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SupportAppSchedulesView extends StatefulWidget {
  SupportAppSchedulesView({
    super.key,
    this.initialDate,
    required this.onSelectionChanged,
  }) {
    initialDate = initialDate ?? DateTime.now();
  }

  // final DateRangePickerController controller;
  DateTime? initialDate;
  final Function(DateRangePickerSelectionChangedArgs) onSelectionChanged;

  @override
  _SupportAppDateRangePickerState createState() =>
      _SupportAppDateRangePickerState();
}

class _SupportAppDateRangePickerState extends State<SupportAppSchedulesView> {
  final Map<String, Color> _days = <String, Color>{
    '일': Color(0xFFFF8888),
    '월': Color(0xFF7C7C7C),
    '화': Color(0xFF7C7C7C),
    '수': Color(0xFF7C7C7C),
    '목': Color(0xFF7C7C7C),
    '금': Color(0xFF7C7C7C),
    '토': Color(0xFF1270B0),
  };

  final headerDateFormat = DateFormat("yyyy년 M월");
  late DateTime displayDate;

  @override
  void initState() {
    displayDate = widget.initialDate!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
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
                headerDateFormat.format(displayDate),
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
            children: _buildCalendar(displayDate),
          ),
        ),
        Divider(
          thickness: 0.5.h,
        ),
      ],
    );
  }

  void addMonth(int monthToAdd) {
    displayDate = displayDate._add(monthToAdd: monthToAdd);
  }

  Widget _cellBuilder(
      BuildContext context, DateRangePickerCellDetails cellDetails) {
    /// [displayDate] 의 다음달의 요일이 일요일이면 trailing date 로 출력 x
    // logger.d(cellDetails.date);
    // logger.d(displayDate._add(monthToAdd: 1).weekday);
    // logger.d(
    //     '${displayDate._add(monthToAdd: 1).weekday == 1} ${cellDetails.date.month != displayDate.month}');
    return Container(
      width: 24.w,
      height: 24.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3.r)),
        border: Border.all(),
      ),
      child: cellDetails.date.month != displayDate.month
          ? Text(
              DateFormat('dd').format(cellDetails.date),
              style: TextStyle(color: const Color(0xFF767676)),
            )
          : Text(DateFormat('dd').format(cellDetails.date)),
    );
  }

  List<Widget> _buildCalendar(DateTime date) {
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
        if (i == 0 && j < firstWeekday - 1) {
          text = '$lastMonthDay';
          color = Colors.grey;
          lastMonthDay++;
        } else if (currentDay > lastDayOfMonth) {
          text = '${currentDay - lastDayOfMonth}';
          color = Colors.grey;
          currentDay++;
        } else {
          text = '$currentDay';
          color = Colors.black;
          currentDay++;
        }
        days.add(
          Flexible(
            child: Column(
              children: [
                Flexible(
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
