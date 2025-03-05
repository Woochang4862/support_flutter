import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/models/schedule_detail_model.dart';
import 'package:support_flutter/utils/dialog_manager.dart';
import 'package:support_flutter/utils/icons/notice_icons_icons.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/viewmodels/schedule_detail_view_model.dart';
import 'package:support_flutter/viewmodels/user_view_model.dart';
import 'package:support_flutter/views/widgets/text_font_widget.dart';

class ScheduleDetailScreen extends ConsumerStatefulWidget {
  final int scheduleId;
  const ScheduleDetailScreen({
    super.key,
    required this.scheduleId,
  });
  @override
  _ScheduleDetailScreenState createState() => _ScheduleDetailScreenState();
}

class _ScheduleDetailScreenState extends ConsumerState<ScheduleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userViewModelProvider);
    final scheduleId = widget.scheduleId;
    final scheduleState =
        ref.watch(scheduleDetailViewModelProvider(scheduleId));

    ref.listen(
      scheduleDetailViewModelProvider(scheduleId),
      (prev, next) {
        logger.d(next);
        next.when(
          data: (data) {
            switch (data.type) {
              case ScheduleDetailModelType.fetch:
                break;
              default:
            }
          },
          error: (error, stackTrace) {},
          loading: () {},
        );
      },
    );

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
          body: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) async {
              final provider =
                  scheduleDetailViewModelProvider(widget.scheduleId);
              await ref
                  .read(provider.notifier)
                  .fetchSchedule(scheduleId: widget.scheduleId);

              if (!didPop && mounted) {
                context.pop();
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: scheduleState.when(
                data: (data) {
                  final schedule = data.data;
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFontWidget.fontRegular(
                              schedule.title,
                              fontSize: 15.sp,
                              color: const Color(0xFF333333),
                              fontWeight: FontWeight.w600,
                            ),
                            userState.value == null ||
                                    userState.value!.data.role == null ||
                                    userState.value!.data.role == "ROLE_MEMBER"
                                ? const SizedBox.shrink()
                                : PopupMenuButton(
                                    color: Colors.white,
                                    icon: Icon(
                                      NoticeIcons.ic_more,
                                      size: 32.sp,
                                    ),
                                    offset: const Offset(0, 40),
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        padding: EdgeInsets.zero,
                                        value: 'modify',
                                        child: Container(
                                          color: Colors.white,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                NoticeIcons.ic_pencil,
                                                color: const Color(0xFF8E8E8E),
                                                size: 17.sp,
                                              ),
                                              SizedBox(width: 8.w),
                                              const Text('수정'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem(
                                        padding: EdgeInsets.zero,
                                        value: 'delete',
                                        child: Container(
                                          color: Colors.white,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                NoticeIcons.ic_waste_bin,
                                                color: const Color(0xFFFF6F6F),
                                                size: 20.sp,
                                              ),
                                              SizedBox(width: 8.w),
                                              const Text('삭제',
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xFFFF6F6F))),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                    onSelected: (value) {
                                      if (value == 'modify') {
                                        // 수정 액션
                                      } else if (value == 'delete') {
                                        DialogManager.instance.showAlertDialog(
                                          context: context,
                                          content: '정말 삭제하시겠습니까?',
                                          leftButtonText: '취소',
                                          rightButtonText: '삭제',
                                          onRightButtonPressed: () async {
                                            try {
                                              // await deleteNoticeViewModel
                                              //     .deleteNotice(
                                              //         noticeId: notice.id);
                                              // ref.refresh(
                                              //     noticeViewModelProvider);
                                              Navigator.pop(context);
                                            } catch (e) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content: Text('삭제 실패: $e')),
                                              );
                                            }
                                          },
                                          isTitleShow: false,
                                          contentStyle: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF000000),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                          ],
                        ),
                        Divider(thickness: 0.5.h),
                        TextFontWidget.fontRegular(
                          '기간 | ${schedule.startDate} ~ ${schedule.endDate}',
                          fontSize: 13.sp,
                          color: const Color(0xFF1C1C1C),
                          fontWeight: FontWeight.w400,
                        ),
                        Divider(thickness: 0.5.h),
                        SizedBox(height: 12.h),
                        TextFontWidget.fontRegular(
                          schedule.content,
                          fontSize: 13.sp,
                          color: const Color(0xFF333333),
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) =>
                    const Center(child: Text('일정을 불러오지 못했습니다.')),
              ),
            ),
          ),
        );
      },
    );
  }
}
