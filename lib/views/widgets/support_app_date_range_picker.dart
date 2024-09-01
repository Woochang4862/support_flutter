import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SupportAppDateRangePicker extends StatefulWidget {
  const SupportAppDateRangePicker({
    super.key,
    required this.controller,
    required this.onSelectionChanged,
  });

  final DateRangePickerController controller;
  final Function(DateRangePickerSelectionChangedArgs) onSelectionChanged;

  @override
  _SupportAppDateRangePickerState createState() =>
      _SupportAppDateRangePickerState();
}

class _SupportAppDateRangePickerState extends State<SupportAppDateRangePicker> {
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
  DateTime displayDate = DateTime.now();

  @override
  void initState() {
    widget.controller.displayDate = displayDate;
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
                      setState(() {
                        displayDate = widget.controller.displayDate!;
                      });
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
                      setState(() {
                        displayDate = widget.controller.displayDate!;
                      });
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
          child: SfDateRangePicker(
            controller: widget.controller,
            headerHeight: 0.h,
            // selectionShape: DateRangePickerSelectionShape.rectangle,
            // cellBuilder: _cellBuilder,
            monthViewSettings: const DateRangePickerMonthViewSettings(
              viewHeaderHeight: 0,
              showTrailingAndLeadingDates: true,
            ),
            backgroundColor: Color(0x00000000),
            startRangeSelectionColor: Color(0xFF4F7BD0),
            endRangeSelectionColor: Color(0xFF4F7BD0),
            rangeSelectionColor: Color(0x774F7BD0),
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              widget.onSelectionChanged(args);
            },
            selectionMode: DateRangePickerSelectionMode.multiRange,
            monthCellStyle: const DateRangePickerMonthCellStyle(
              todayCellDecoration: BoxDecoration(),
              todayTextStyle: TextStyle(color: Color(0xFF4F7BD0)),
            ),
            // cellBuilder: _cellBuilder,
          ),
        ),
        Divider(
          thickness: 0.5.h,
        ),
      ],
    );
  }

  void addMonth(int monthToAdd) {
    final currentDate = widget.controller.displayDate!;
    widget.controller.displayDate = currentDate._add(monthToAdd: monthToAdd);
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
