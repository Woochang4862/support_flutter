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
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
        );
    contentStyle = contentStyle ??
        TextFontWidget.fontRegularStyle(
          color: Color(0xFF000000),
          fontSize: 11.sp,
          fontWeight: FontWeight.w300,
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
                padding: EdgeInsets.only(
                  top: widget.title == null ? 50.h : 32.h,
                  left: 15.h,
                  right: 15.h,
                  bottom: 15.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: mainColor,
                ),
                child: Column(
                  crossAxisAlignment: widget.title == null
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...[
                          if (widget.title != null)
                            Container(
                              margin: EdgeInsets.only(bottom: 8.h),
                              child: Text(
                                widget.title!,
                                style: widget.titleStyle,
                              ),
                            ),
                        ],
                        if (widget.content != null)
                          Text(
                            widget.content!,
                            style: widget.contentStyle,
                          ),
                      ],
                    ),
                    SizedBox.fromSize(
                      size: Size.fromHeight(widget.title == null ? 50.h : 19.h),
                    ),
                    SizedBox(
                      height: 43.h,
                      child: widget.leftButtonText != null &&
                              widget.rightButtonText != null
                          ? Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      widget.onLeftButtonPressed?.call();
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFBDBDBD),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.r)),
                                      ),
                                      child: TextFontWidget.fontRegular(
                                        widget.leftButtonText!,
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      widget.onRightButtonPressed?.call();
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: accentColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.r)),
                                      ),
                                      child: TextFontWidget.fontRegular(
                                        widget.rightButtonText!,
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : InkWell(
                              onTap: () {
                                widget.onLeftButtonPressed?.call();
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: accentColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.r)),
                                ),
                                child: TextFontWidget.fontRegular(
                                  widget.leftButtonText!,
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              );
            }));
  }
}
