import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support_flutter/utils/icons/washing_machine_icon_icons.dart';
import 'package:support_flutter/viewmodels/user_view_model.dart';
import 'package:support_flutter/views/widgets/text_font_widget.dart';

class LaundaryScreen extends ConsumerStatefulWidget {
  const LaundaryScreen({Key? key}) : super(key: key);

  @override
  _LaundaryScreenState createState() => _LaundaryScreenState();
}

class _LaundaryScreenState extends ConsumerState<LaundaryScreen> {
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userViewModelProvider);

    return Builder(builder: (context) {
      return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return Scaffold(
              body: userState.value == null
                  ? Center(
                      child: TextFontWidget.fontRegular(
                        '정보를 가져올 수 없습니다.\n[로그인] > [내 정보] > [기숙사 동] 수정',
                        textAlign: TextAlign.center,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisSpacing: 20.h),
                        children: [
                          laundaryItem(1, true),
                          laundaryItem(2, false),
                          laundaryItem(3, true),
                          laundaryItem(4, false),
                          laundaryItem(5, true),
                          laundaryItem(6, false),
                          laundaryItem(7, true),
                          laundaryItem(8, false),
                          laundaryItem(9, true),
                          laundaryItem(10, false),
                        ],
                      ),
                    ),
            );
          });
    });
  }

  Widget laundaryItem(int id, bool isAvailable) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            color: isAvailable ? Color(0xFFF1F9FF) : Color(0x33B0B0B0),
            border: Border.all(
                color: isAvailable ? Color(0xFFC9E8FF) : Color(0xFFAFAFAF),
                width: 1.w),
          ),
          child: Icon(
            WashingMachineIcon.ic_washing_machine,
            size: 140.w,
            color: isAvailable ? Color(0xFF49A0E2) : Color(0xFFBCBCBC),
          ),
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFontWidget.fontRegular(
                '세탁기 $id',
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
              SizedBox(
                width: 2.w,
              ),
              VerticalDivider(
                indent: 6.h,
                endIndent: 6.h,
                thickness: 1.5,
              ),
              SizedBox(
                width: 2.w,
              ),
              TextFontWidget.fontRegular(
                isAvailable ? '사용가능' : '사용중',
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: isAvailable ? Color(0xFF59B7FF) : Color(0xFFFF6363),
              ),
            ],
          ),
        )
      ],
    );
  }
}
