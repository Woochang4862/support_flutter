import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class EditNoticeScreen extends ConsumerStatefulWidget {
  const EditNoticeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditNoticeScreenState();
}

class _EditNoticeScreenState extends ConsumerState<EditNoticeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  String startDate = '2024-10-13';
  String endDate = '2024-10-17';

  @override
  Widget build(BuildContext context) {
    contentController.addListener(() {});

    titleController.addListener(() {});

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
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
                        '공지사항 작성',
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
                              backgroundColor: const Color(0xFF4F7BD0),
                              surfaceTintColor: const Color(0xFF4F7BD0),
                              foregroundColor: Colors.white,
                              side: BorderSide(
                                width: 0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {},
                            child: Text(
                              '작성완료',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400,
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
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
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
                                  color: Color(0xFF9F9F9F),
                                  
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF4F7BD0)),
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
                            maxLines: null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '내용 입력',
                              hintStyle: TextStyle(
                                  color: const Color(0xFF9F9F9F),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13.sp),
                              contentPadding:
                                  EdgeInsets.only(left: 5.w, top: 10.h),
                              isDense: true,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: (50).h,
                        left: 0,
                        right: 0,
                        child: Divider(
                          thickness: 1.h,
                        ),
                      ),
                      Positioned(
                        bottom: 0.h,
                        left: 0,
                        right: 0,
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
                                      ' | ',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF727272),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Text(
                                      startDate,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF000000),
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
                                      ' | ',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF727272),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Text(
                                      endDate,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  void showAlertDialog(BuildContext context, String text) async {
    // await showDialog(
    //     context: context,
    //     builder: (_) => AlertTextDialog(
    //           text: text,
    //           onConfirmPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //         ));
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
