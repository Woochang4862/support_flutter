import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/utils/icons/notice_icons_icons.dart';
import 'package:support_flutter/viewmodels/user_view_model.dart';
import 'package:support_flutter/views/screens/edit_notice_screen.dart';
import 'package:support_flutter/views/widgets/text_font_widget.dart';
import 'package:support_flutter/viewmodels/notice_view_model.dart';
import 'package:support_flutter/viewmodels/delete_notice_view_model.dart'; // 추가

class NoticeScreen extends ConsumerStatefulWidget {
  const NoticeScreen({super.key});

  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends ConsumerState<NoticeScreen> {
  List<bool> _isExpanded = []; // 확장 상태 관리 리스트

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userViewModelProvider);
    final noticeState = ref.watch(noticeViewModelProvider);
    final deleteNoticeViewModel =
        ref.watch(deleteNoticeViewModelProvider.notifier); // 추가

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
                    '공지사항',
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
            child: noticeState.when(
              data: (notices) {
                if (_isExpanded.isEmpty) {
                  // 데이터 로드 후 확장 상태 초기화
                  _isExpanded = List<bool>.filled(notices.length, false);
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      if (!_isExpanded.contains(true)) Divider(thickness: 1.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: notices.length,
                        itemBuilder: (context, index) {
                          final notice = notices[index];
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
                                        horizontal: 16.w, vertical: 12.h),
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
                                                    notice.title,
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
                                                      ? SizedBox.shrink()
                                                      : PopupMenuButton(
                                                          color: Colors.white,
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
                                                                color: Colors
                                                                    .white,
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
                                                                    const Text(
                                                                        '수정'),
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
                                                                    const Text(
                                                                        '삭제',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Color(0xFFFF6F6F))),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                          onSelected: (value) {
                                                            if (value ==
                                                                'modify') {
                                                              // 수정 액션
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const EditNoticeScreen(),
                                                                ),
                                                              );
                                                            } else if (value ==
                                                                'delete') {
                                                              // 삭제 액션
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) =>
                                                                        AlertDialog(
                                                                  title:
                                                                      const Text(
                                                                          '삭제'),
                                                                  content:
                                                                      const Text(
                                                                          '정말 삭제하시겠습니까?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(context),
                                                                      child: const Text(
                                                                          '취소'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed:
                                                                          () async {
                                                                        // 삭제 로직 추가
                                                                        try {
                                                                          await deleteNoticeViewModel.deleteNotice(
                                                                              noticeId: notice.id);
                                                                          // 상태 업데이트
                                                                          ref.refresh(
                                                                              noticeViewModelProvider);
                                                                          Navigator.pop(
                                                                              context);
                                                                        } catch (e) {
                                                                          // 에러 처리
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(content: Text('삭제 실패: $e')),
                                                                          );
                                                                        }
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        '확인',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.red),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                ],
                                              ),
                                              Divider(thickness: 0.5.h),
                                              Row(
                                                children: [
                                                  TextFontWidget.fontRegular(
                                                    '작성일자 |',
                                                    fontSize: 13.sp,
                                                    color:
                                                        const Color(0xFF111111),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: TextFontWidget
                                                        .fontRegular(
                                                      notice.creationDate,
                                                      fontSize: 13.sp,
                                                      color: const Color(
                                                          0xFF111111),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(thickness: 0.5.h),
                                              TextFontWidget.fontRegular(
                                                notice.content,
                                                fontSize: 14.sp,
                                                color: const Color(0xFF333333),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextFontWidget.fontRegular(
                                                notice.title,
                                              ),
                                              TextFontWidget.fontRegular(
                                                notice.creationDate,
                                                color: const Color(0xFFAEAEAE),
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
          floatingActionButton: userState.value == null ||
                  userState.value!.data.role == null ||
                  userState.value!.data.role == "ROLE_MEMBER"
              ? null
              : FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditNoticeScreen(),
                      ),
                    );
                  },
                  backgroundColor: mainColor,
                  child: const Icon(Icons.add),
                ),
        );
      },
    );
  }
}
