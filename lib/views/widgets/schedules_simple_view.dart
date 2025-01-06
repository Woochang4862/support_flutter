import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/models/schedules_model.dart';

class SchedulesSimpleView extends StatelessWidget {
  SchedulesSimpleView({
    super.key,
    required this.schedules,
  });

  final List<Schedule> schedules;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: schedules.length == 1
            ? [
                Container(
                  width: 6.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(3.r),
                      right: Radius.circular(3.r),
                    ),
                    color: schedules[0].color.toColor(),
                  ),
                ),
              ]
            : List.generate(schedules.length, (i) => i).map((i) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: i == 0 ? Radius.circular(3.r) : Radius.zero,
                      right: i == schedules.length - 1
                          ? Radius.circular(3.r)
                          : Radius.zero,
                    ),
                    color: schedules[i].color.toColor(),
                  ),
                  height: 6.h,
                  width: 6.w,
                );
              }).toList(),
      ),
    );
  }
}

extension on int {
  Color toColor() {
    if (this < 0 || this >= colors.length) {
      return Colors.grey;
    }
    return colors[this];
  }
}
