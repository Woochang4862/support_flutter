import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support_flutter/models/profile_model.dart';
import 'package:support_flutter/utils/icons/washing_machine_icon_icons.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/viewmodels/profile_view_model.dart';
import 'package:support_flutter/viewmodels/user_view_model.dart';
import 'package:support_flutter/views/widgets/text_font_widget.dart';

enum LaundryStatus {
  inUse('사용중', Color(0xFFFF6363), Color(0x33B0B0B0), Color(0xFFBCBCBC),
      Color(0xFFAFAFAF)),
  available('사용가능', Color(0xFF59B7FF), Color(0xFFF1F9FF), Color(0xFF49A0E2),
      Color(0xFFC9E8FF)),
  unknown('점검중', Color(0xFFBCBCBC), Color.fromARGB(33, 176, 176, 176),
      Color.fromARGB(92, 188, 188, 188), Color.fromARGB(120, 175, 175, 175));

  const LaundryStatus(this.message, this.textColor, this.backgroundColor,
      this.iconColor, this.borderColor);
  final String message;
  final Color textColor;
  final Color backgroundColor;
  final Color iconColor;
  final Color borderColor;

  factory LaundryStatus.fromBoolString(String inUse) {
    switch (inUse) {
      case '1':
        return LaundryStatus.inUse;
      case '0':
        return LaundryStatus.available;
      default:
        return LaundryStatus.unknown;
    }
  }
}

class LaundaryScreen extends ConsumerStatefulWidget {
  const LaundaryScreen({super.key});

  @override
  _LaundaryScreenState createState() => _LaundaryScreenState();
}

class _LaundaryScreenState extends ConsumerState<LaundaryScreen> {
  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileViewModelProvider);
    ref.listen(userViewModelProvider, (previous, next) {
      final fetch = () async {
        await ref.read(profileViewModelProvider.notifier).fetch();
      };
      next.when(
          data: (data) {
            fetch();
          },
          error: (error, stackTrace) {
            fetch();
          },
          loading: () {},
          skipLoadingOnRefresh: true,
          skipLoadingOnReload: true);
    });

    return Builder(
      builder: (context) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return Scaffold(
              body: profileState.when(
                data: (data) {
                  final profile = data?.data;
                  return profile == null
                      ? Center(
                          child: TextFontWidget.fontRegular(
                            '정보를 가져올 수 없습니다.\n[로그인] > [내 정보] > [기숙사 동] 수정',
                            textAlign: TextAlign.center,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        )
                      : _buildLaundaryList(DormType.fromCode(profile.dormType));
                },
                error: (Object error, StackTrace stackTrace) {
                  return Center(
                    child: TextFontWidget.fontRegular(
                      '정보를 가져올 수 없습니다.\n[로그인] > [내 정보] > [기숙사 동] 수정',
                      textAlign: TextAlign.center,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildLaundaryList(DormType dormType) {
    FirebaseDatabase database = FirebaseDatabase.instance;
    return StreamBuilder(
        stream: database.ref().child(dormType.name).onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String? stringOfInUse = snapshot.data?.snapshot.value as String?;
            logger.d(stringOfInUse);
            List<LaundryStatus> listOfInUse = (stringOfInUse?.split(',') ?? [])
                .map((e) => LaundryStatus.fromBoolString(e))
                .toList();

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 20.h),
                children: List.generate(
                  listOfInUse.length,
                  (index) => laundaryItem(index + 1, listOfInUse[index]),
                ),
              ),
            );
          } else {
            return Center(
              child: TextFontWidget.fontRegular(
                '정보를 가져올 수 없습니다.',
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            );
          }
        });
  }

  Widget laundaryItem(int id, LaundryStatus laundryStatus) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            color: laundryStatus.backgroundColor,
            border: Border.all(color: laundryStatus.borderColor, width: 1.w),
          ),
          child: Icon(
            WashingMachineIcon.ic_washing_machine,
            size: 140.w,
            color: laundryStatus.iconColor,
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
                laundryStatus.message,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: laundryStatus.textColor,
              ),
            ],
          ),
        )
      ],
    );
  }
}
