import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/views/screens/edit_notice_screen.dart';
import 'package:support_flutter/views/widgets/text_font_widget.dart';

class NoticeScreen extends ConsumerStatefulWidget {
  const NoticeScreen({super.key});

  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends ConsumerState<NoticeScreen> {
  final TextEditingController emailController = TextEditingController();

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
                    '공지사항',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: const Color(0xff111111),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 52.w, height: 52.h)
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              SizedBox(height: 20.h),
              ListView.separated(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TextFontWidget.fontRegular('ysdf');
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 1.h,
                  );
                },
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditNoticeScreen()));
            },
            backgroundColor: mainColor,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
