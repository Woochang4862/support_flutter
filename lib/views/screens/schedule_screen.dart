import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/utils/extensions.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/viewmodels/schedules_view_model.dart';
import 'package:support_flutter/viewmodels/user_view_model.dart';
import 'package:support_flutter/views/widgets/notice_item.dart';
import 'package:support_flutter/views/widgets/schedules_view.dart';
import 'package:support_flutter/views/widgets/text_font_widget.dart';

class ScheduleScreen extends ConsumerStatefulWidget {
  const ScheduleScreen({super.key});

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends ConsumerState<ScheduleScreen> {
  var displayDate = DateTime.now();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userViewModelProvider);
    final schedulesState =
        ref.watch(schedulesViewModelProvider(displayDate.format('yyyy-MM')));
    logger.d(userState);
    return Builder(builder: (context) {
      return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return Scaffold(
              floatingActionButton: userState.value == null ||
                      userState.value!.data.role == null ||
                      userState.value!.data.role == "ROLE_MEMBER"
                  ? null
                  : FloatingActionButton(
                      onPressed: () => context.go('/edit_notice'),
                      backgroundColor: mainColor,
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.add,
                        color: Color(0xFF000000),
                      ),
                    ),
              body: schedulesState.when<Widget>(data: (scheduleGroups) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 24.w, 24.h, 0),
                  child: Column(
                    children: [
                      SchedulesView(
                        displayDate: displayDate,
                        schedules: scheduleGroups!,
                        onMonthChanged: (date) {
                          logger.d(date);
                          displayDate = date;
                          ref.read(schedulesViewModelProvider(
                              displayDate.format('yyyy-MM')));
                        },
                        onSelectionChanged: (date) {
                          logger.d(date);
                          setState(() {
                            selectedDate = date;
                          });
                        },
                      ),
                      Flexible(
                        flex: 1,
                        child: Builder(builder: (context) {
                          final schedules = scheduleGroups[
                                  selectedDate.format('yyyy-MM-dd')] ??
                              [];
                          return schedules.isEmpty
                              ? Center(
                                  child:
                                      TextFontWidget.fontRegular('일정이 없습니다!'),
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: schedules.length,
                                  itemBuilder: (context, index) {
                                    return NoticeItem(
                                        title: schedules[index].title,
                                        onItemClick: () {
                                          context.go(
                                              '/schedule_detail/${schedules[index].id}');
                                        });
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider(
                                      thickness: 1.h,
                                    );
                                  },
                                );
                        }),
                      ),
                    ],
                  ),
                );
              }, error: (error, stackTrace) {
                return Container();
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
            );
          });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
