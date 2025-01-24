// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/views/widgets/text_font_widget.dart';

class AlertTextDialog extends StatefulWidget {
  AlertTextDialog({
    super.key,
    this.title,
    this.content,
    this.titleStyle,
    this.contentStyle,
    this.onLeftButtonPressed,
    this.onRightButtonPressed,
    this.leftButtonText,
    this.rightButtonText,
  }) {
    titleStyle = titleStyle ??
        TextFontWidget.fontRegularStyle(
          color: Color(0xFF000000),
          fontSize: 18.sp,
          fontWeight: FontWeight.w800,
          textAlign: TextAlign.center,
        );
    contentStyle = contentStyle ??
        TextFontWidget.fontRegularStyle(
          color: Color(0xFF767676),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        );
  }

  final String? title;
  final String? content;
  late TextStyle? titleStyle;
  late TextStyle? contentStyle;
  final void Function()? onLeftButtonPressed, onRightButtonPressed;
  final String? leftButtonText, rightButtonText;

  @override
  _AlertTextDialogState createState() => _AlertTextDialogState();
}

class _AlertTextDialogState extends State<AlertTextDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, _) {
              return Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15.h,
                  horizontal: 15.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: mainColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...[
                          widget.title == null
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(bottom: 8.h),
                                  child: Text(
                                    widget.title!,
                                    style: widget.titleStyle,
                                  ),
                                ),
                        ],
                        widget.content == null
                            ? Container()
                            : Text(
                                widget.content!,
                                style: widget.contentStyle,
                              ),
                      ],
                    ),
                    SizedBox.fromSize(
                      size: Size.fromHeight(15.h),
                    ),
                    if (widget.leftButtonText != null &&
                        widget.rightButtonText != null)
                      SizedBox(
                        height: 56.h,
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  widget.onLeftButtonPressed?.call();
                                  Navigator.of(context).pop();
                                },
                                style: OutlinedButton.styleFrom(
                                  minimumSize: Size.fromHeight(56.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.r)),
                                  ),
                                ),
                                child: TextFontWidget.fontRegular(
                                  widget.leftButtonText!,
                                  color: Color(0xFF0085FF),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  widget.onRightButtonPressed?.call();
                                  Navigator.of(context).pop();
                                },
                                style: OutlinedButton.styleFrom(
                                  minimumSize: Size.fromHeight(56.h),
                                  //primary: mainColor,
                                  //onPrimary: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.r)),
                                  ),
                                ),
                                child: TextFontWidget.fontRegular(
                                  widget.rightButtonText!,
                                  color: Color(0xFF0085FF),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      TextButton(
                        onPressed: () {
                          widget.onLeftButtonPressed?.call();
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.fromHeight(50.h),
                          //primary: mainColor,
                          //onPrimary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.zero,
                                bottom: Radius.circular(15.r)),
                          ),
                        ),
                        child: TextFontWidget.fontRegular(
                          widget.leftButtonText!,
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
