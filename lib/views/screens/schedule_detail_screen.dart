import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/models/schedule_detail_model.dart';
import 'package:support_flutter/models/schedules_model.dart';
import 'package:support_flutter/utils/icons/notice_icons_icons.dart';
import 'package:support_flutter/viewmodels/schedule_detail_view_model.dart';
import 'package:support_flutter/views/widgets/text_font_widget.dart';

class ScheduleDetailScreen extends ConsumerStatefulWidget {
  const ScheduleDetailScreen({super.key});

  @override
  _ScheduleDetailScreenState createState() => _ScheduleDetailScreenState();
}

class _ScheduleDetailScreenState extends ConsumerState<ScheduleDetailScreen> {
  List<bool> _isExpanded = [];

  get sizeBox => null;
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(scheduleDetailViewModelProvider);
    final scheduleState = ref.watch(scheduleDetailViewModelProvider);
    final deleteScheduleViewModel =
        ref.watch(scheduleDetailViewModelProvider.notifier);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
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
                        context.pop();
                      },
                      icon: SvgPicture.asset(
                        'assets/images/ic_back_arrow.svg',
                      ),
                    ),
                  ),
                  TextFontWidget.fontRegular(
                    '일정',
                    fontSize: 18.sp,
                    color: const Color(0xff111111),
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(width: 52.w, height: 52.h)
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: scheduleState.when(
              data: (schedules) {
                if (_isExpanded.isEmpty) {
                  _isExpanded = List<bool>.filled(schedules.length, false);
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      if (!_isExpanded.contains(true))
                        Divider(
                          thickness: 1.h,
                        ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: schedules.length,
                        itemBuilder: (context, index) {
                          final schedule = schedules[index];
                          final isExpanded = _isExpanded[index];

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _isExpanded[index] = !isExpanded;
                              });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AnimatedSize(
                                  curve: Curves.easeInOut,
                                  duration: const Duration(milliseconds: 600),
                                  child: Container(
                                    color: const Color(0xFFFFFFFF),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 12.h,
                                    ),
                                    child: isExpanded
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TextFontWidget.fontRegular(
                                                    schedule.title,
                                                    fontSize: 15.sp,
                                                    color:
                                                        const Color(0xFF333333),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  userState.value == null ||
                                                          userState.value!.data
                                                                  .role ==
                                                              null ||
                                                          userState.value!.data
                                                                  .role ==
                                                              "ROLE_MEMBER"
                                                      ? sizeBox.shrink()
                                                      : PopupMenuButton(
                                                          color: const Color(
                                                              0xFFFFFFFF),
                                                          icon: Icon(
                                                            NoticeIcons.ic_more,
                                                            size: 32.sp,
                                                          ),
                                                          offset: const Offset(
                                                              0, 40),
                                                          itemBuilder:
                                                              (context) => [
                                                            PopupMenuItem(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              value: 'modify',
                                                              child: Container(
                                                                color: const Color(
                                                                    0xFFFFFFFF),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Icon(
                                                                      NoticeIcons
                                                                          .ic_pencil,
                                                                      color: Color(
                                                                          0xFF8E8E8E),
                                                                      size:
                                                                          17.sp,
                                                                    ),
                                                                    SizedBox(
                                                                        width: 8
                                                                            .w),
                                                                    TextFontWidget
                                                                        .fontRegular(
                                                                      '수정',
                                                                      fontSize:
                                                                          14.sp,
                                                                      color: const Color(
                                                                          0x00000000),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            PopupMenuItem(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              value: 'delete',
                                                              child: Container(
                                                                color: Colors
                                                                    .white,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Icon(
                                                                      NoticeIcons
                                                                          .ic_waste_bin,
                                                                      color: Color(
                                                                          0xFFFF6F6F),
                                                                      size:
                                                                          20.sp,
                                                                    ),
                                                                    SizedBox(
                                                                        width: 8
                                                                            .w),
                                                                    TextFontWidget
                                                                        .fontRegular(
                                                                      '삭제',
                                                                      fontSize:
                                                                          14.sp,
                                                                      color: const Color(
                                                                          0xFFFF6F6F),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                          onSelected: (value) {
                                                            if (value ==
                                                                'modify') {
                                                              context.go(
                                                                  '/edit_schedule');
                                                            } else if (value ==
                                                                'delete') {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) =>
                                                                        AlertDialog(
                                                                  title: TextFontWidget
                                                                      .fontRegular(
                                                                          '삭제'),
                                                                  content: TextFontWidget
                                                                      .fontRegular(
                                                                          '정말 삭제하시겠습니까?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(context),
                                                                      child: TextFontWidget
                                                                          .fontRegular(
                                                                              '취소'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                ],
                                              ),
                                              Divider(
                                                thickness: 0.5.h,
                                              ),
                                              Row(
                                                children: [
                                                  TextFontWidget.fontRegular(
                                                    '기간 |',
                                                    fontSize: 13.sp,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: TextFontWidget
                                                        .fontRegular(
                                                      '${schedule.startDate} ~ ${schedule.endDate}',
                                                      fontSize: 13.sp,
                                                      color:
                                                          const Color(0x1C1C1C),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                thickness: 0.5.h,
                                              ),
                                              TextFontWidget.fontRegular(
                                                schedule.content,
                                                fontSize: 13.sp,
                                                color: const Color(0x1C1C1C),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextFontWidget.fontRegular(
                                                schedule.title,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                    "assets/images/profile_image_sample.png"),
                                                width: 40.w,
                                                height: 40.h,
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                                Divider(thickness: 1.h),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text('Error: $error')),
            ),
          ),
        );
      },
    );
  }
}

extension on List<ScheduleDetail> {
  get data => null;
}
