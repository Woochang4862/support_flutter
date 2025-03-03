import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/models/notice_model.dart';
import 'package:support_flutter/utils/dialog_manager.dart';
import 'package:support_flutter/utils/extensions.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/viewmodels/notice_view_model.dart';
import 'package:intl/intl.dart';
import 'package:support_flutter/viewmodels/schedules_view_model.dart';

class EditNoticeScreen extends ConsumerStatefulWidget {
  const EditNoticeScreen({super.key, this.isNotice = true});

  final bool isNotice;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditNoticeScreenState();
}

class _EditNoticeScreenState extends ConsumerState<EditNoticeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    contentController.addListener(() {});
    titleController.addListener(() {});

    ref.listen(noticeViewModelProvider, (prev, next) {
      logger.d(next);
      next.when(
          data: (data) async {
            switch (data.type) {
              case NoticeModelType.fetch:
                // 화면 닫기
                context.pop();
                break;
              case NoticeModelType.create:
                ref.read(noticeViewModelProvider.notifier).fetchNotices();
                break;
              default:
            }
          },
          error: (error, stackTrace) {},
          loading: () {});
    });

    return ScreenUtilInit(
        designSize: const Size(375, 812), // 디자인 기준 사이즈 설정
        builder: (context, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false, // 기본 뒤로가기
                titleSpacing: 0.0,
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w), //좌우 패딩 설정
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
                        '${widget.isNotice ? '공지사항' : '일정'} 작성',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: const Color(0xFF111111),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 56.w,
                        height: 40.h,
                        child: Container(
                          margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: accentColor,
                              surfaceTintColor: const Color(0xFF4F7BD0),
                              foregroundColor: mainColor,
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () async {
                              final title = titleController.text.trim();
                              final content = contentController.text;
                              final startDateString =
                                  startDate?.format('yyyy-MM-dd');
                              final endDateString =
                                  endDate?.format('yyyy-MM-dd');
                              if (title.isNotEmpty &&
                                  content.isNotEmpty &&
                                  startDateString != null &&
                                  endDateString != null) {
                                // 서버로 요청
                                if (widget.isNotice) {
                                  await ref
                                      .read(noticeViewModelProvider.notifier)
                                      .createNotice(
                                          title: title, content: content);
                                } else {
                                  await ref
                                      .read(schedulesViewModelProvider.notifier)
                                      .createSchedule(
                                          title: title,
                                          content: content,
                                          startDate: startDateString,
                                          endDate: endDateString);
                                }
                              }
                            }, // 누르면 공지스크린 창에 추가되도록 기능 구현하기기
                            child: Text(
                              '작성완료',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(top: 25.h),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 6.h,
                        left: 0.w,
                        right: 0.w,
                        child: SizedBox(
                          height: 20.h,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            controller: titleController,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "제목 입력",
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD9D9D9),
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD9D9D9),
                                  width: 1.0,
                                ),
                              ),
                              hintStyle: TextStyle(
                                  color: const Color(0xFF9F9F9F),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15.sp),
                              contentPadding:
                                  EdgeInsets.only(left: 5.w, bottom: 10.h),
                            ),
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ),
                      Positioned(
                        top: (6 + 20 + 10).h,
                        bottom: (50 + 10).h,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          child: TextField(
                            expands: true,
                            keyboardType: TextInputType.multiline,
                            maxLines: null, //여러 줄 입력 가능
                            controller: contentController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '내용 입력',
                              hintStyle: TextStyle(
                                  color: const Color(0xFF9F9F9F),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13.sp),
                              contentPadding:
                                  EdgeInsets.only(left: 5.w, top: 20.h),
                              isDense: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: (widget.isNotice)
                  ? null
                  : Container(
                      padding: EdgeInsets.only(
                          left: 16.w, right: 16.w, bottom: 16.h),
                      child: InkWell(
                        onTap: () {
                          DialogManager.instance.showDateRangePickerDialog(
                            context: context,
                            onComplete: (selecteDateRange) {
                              logger.d(selecteDateRange);
                              setState(() {
                                startDate = selecteDateRange?.start;
                                endDate = selecteDateRange?.end;
                              });
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 8.w),
                          alignment: Alignment.centerLeft,
                          height: 50.h,
                          child: Table(
                            columnWidths: const {
                              0: IntrinsicColumnWidth(),
                              1: IntrinsicColumnWidth(),
                              2: IntrinsicColumnWidth(),
                            },
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Text(
                                      '시작날짜',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF727272),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Text(
                                      '  |  ',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFFD9D9D9),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Text(
                                      DateFormat('yy/MM/dd').format(
                                          (startDate ?? DateTime.now())),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF727272),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Text(
                                      '종료날짜',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF727272),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Text(
                                      '  |  ',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFFD9D9D9),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Text(
                                      DateFormat('yy/MM/dd')
                                          .format((endDate ?? DateTime.now())),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF727272),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ));
  }

  bool nameIsInvalid(String? state) {
    // if (state is SignUpModelError) {
    //   switch (state.code) {
    //     case "USR-207":
    //     case "USR-F100":
    //       return true;
    //   }
    // }
    return false;
  }

  bool nickNameIsInvalid(String? state) {
    // if (state is SignUpModelError) {
    //   switch (state.code) {
    //     case "USR-F400":
    //       return true;
    //   }
    // }
    return false;
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}
