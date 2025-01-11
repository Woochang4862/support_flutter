import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/views/widgets/date_range_picker.dart';
import 'package:support_flutter/views/widgets/text_font_widget.dart';

class DateRangePickerDialog extends StatefulWidget {
  const DateRangePickerDialog({super.key});

  @override
  _DateRangePickerDialogState createState() => _DateRangePickerDialogState();
}

class _DateRangePickerDialogState extends State<DateRangePickerDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, _) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: mainColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 15.h,
                        horizontal: 15.h,
                      ),
                      child: DateRangePicker(
                        displayDate: DateTime.now(),
                      ),
                    ),
                    SizedBox.fromSize(
                      size: Size.fromHeight(0.5.h),
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xFFCECECE)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size.fromHeight(50.h),
                        //primary: mainColor,
                        //onPrimary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.zero, bottom: Radius.circular(15.r)),
                        ),
                      ),
                      child: TextFontWidget.fontRegular(
                        '확인',
                        color: Color(0xFF0085FF),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
