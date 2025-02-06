import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/views/widgets/text_font_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0.0,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 52.w,
                    height: 52.h,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: SvgPicture.asset(
                        'assets/images/ic_back_arrow.svg',
                      ),
                    ),
                  ),
                  Text(
                    '문의하기',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: const Color(0xFF111111),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 52.w, height: 52.h)
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 12.h),
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFontWidget.fontRegular(
                    '기숙사 관련 문의',
                    color: const Color(0xFF000000),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFBFBFBF),
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: TextFontWidget.fontRegularStyle(
                                color: const Color(0xFF000000),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                const TextSpan(
                                  text: '기숙사 행정실',
                                ),
                                TextSpan(
                                  text: '  |  ',
                                  style: TextFontWidget.fontRegularStyle(
                                    color: const Color(0xFFBFBFBF),
                                  ),
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      final result = await launchUrl(
                                          Uri.parse('tel://031-229-8202'),
                                          mode: LaunchMode.platformDefault);
                                      if (result) {
                                        logger.d('Successfully made a call!');
                                      } else {
                                        logger.d('Failed to make a call!');
                                      }
                                    },
                                  text: '031-229-8202',
                                  style: TextFontWidget.fontRegularStyle(
                                    color: const Color(0xFF50ADFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Divider(
                    indent: 30.w,
                    endIndent: 30.w,
                    color: const Color(0xFFBFBFBF),
                    thickness: 1.w,
                  ),
                  SizedBox(height: 20.h),
                  TextFontWidget.fontRegular(
                    '앱 관련 문의',
                    color: const Color(0xFF000000),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: InkWell(
                      onTap: () async {
                        final result = await launchUrl(
                            Uri.parse(
                                'https://docs.google.com/forms/d/e/1FAIpQLSdt9ytLeMND3dTk3GNPx_nRL8_kpT1yg7yrmAu4Cf2MLob9hA/viewform?usp=header'),
                            mode: LaunchMode.platformDefault);
                        if (result) {
                          logger.d('Successfully opened the feedback form!');
                        } else {
                          logger.d('Failed to open the feedback form!');
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFBFBFBF),
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: TextFontWidget.fontRegular(
                          '피드백',
                          color: const Color(0xFF000000),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
