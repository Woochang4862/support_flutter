import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

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
                          Text(
                            '기숙사 행정실 | 031-229-8202',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () async {
                              final result = await launchUrlString('tel://031-229-8202', mode: LaunchMode.platformDefault);
                              if (result) {

                              } else {
                                logger.d('Failed to make a call!');
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF000000),
                              foregroundColor: const Color(0xFFFFFFFF),
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                              ),
                            ),
                            child: Text(
                              '통화 연결',
                              style: TextStyle(
                              fontSize: 10.sp,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600,
                            ),
                            ),
                          ),
                        ],
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
