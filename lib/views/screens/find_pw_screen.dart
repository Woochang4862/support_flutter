import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/models/find_pw_model.dart';
import 'package:support_flutter/utils/dialog_manager.dart';
import 'package:support_flutter/utils/error_util.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/viewmodels/find_pw_view_model.dart';
import 'package:support_flutter/views/widgets/rounded_text_field.dart';
import 'package:support_flutter/views/widgets/text_font_widget.dart';

class FindPwScreen extends ConsumerStatefulWidget {
  const FindPwScreen({Key? key}) : super(key: key);

  @override
  _FindPwScreenState createState() => _FindPwScreenState();
}

class _FindPwScreenState extends ConsumerState<FindPwScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(findPWViewModelProvider);
    ref.listen(findPWViewModelProvider, (prev, next) {
      logger.d(next);
      next.when(
          data: (data) {
            switch (data!.type) {
              case FindPWModelType.findPW:
                DialogManager.instance.showAlertDialog(
                    context: context,
                    content: '비밀번호가 초기화되었습니다.\n학교 이메일로 초기화된 비밀번호가 전송되었습니다!');
                break;
              default:
            }
          },
          error: (error, stackTrace) {
            error = error as FindPWModelError;
            DialogManager.instance.showAlertDialog(
                context: context,
                content: ErrorUtil.instance.getErrorMessage(error.code));
          },
          loading: () {});
    });
    emailController.addListener(
      () {},
    );
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
                        '비밀번호 찾기',
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
              bottomNavigationBar: SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 10.h,
                  ),
                  width: double.infinity,
                  height: 76.h,
                  child: OutlinedButton(
                    onPressed: () => context.go('/login'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: mainColor,
                      backgroundColor: accentColor,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      '로그인하러 가기',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 60.h),
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                        child: RoundedTextField(
                          textInputAction: TextInputAction.done,
                          textEditController: emailController,
                          leftBottomCornerRadius: 8.r,
                          rightBottomCornerRadius: 8.r,
                          leftTopCornerRadius: 8.r,
                          rightTopCornerRadius: 8.r,
                          borderWidth: 1.w,
                          maxLines: 1,
                          textInputType: TextInputType.text,
                          textAlign: TextAlign.left,
                          hintText: '학교 이메일 @suwon.ac.kr',
                          isAnimatedHint: false,
                          prefixIcon: SvgPicture.asset(
                            'assets/images/ic_person.svg',
                            width: 13.w,
                            height: 16.h,
                            fit: BoxFit.scaleDown,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFF989898),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFontWidget.fontRegular(
                        '보안을 위해 메일로 초기화된 비밀번호를 발송해 드립니다.\n로그인 후 변경해 주세요.',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF989898),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                          onPressed: state.isLoading
                              ? null
                              : () async {
                                  final id = emailController.text.trim();
                                  await ref
                                      .read(findPWViewModelProvider.notifier)
                                      .findPW(id: id);
                                },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: mainColor,
                            backgroundColor: const Color(0xFF4F4F4F),
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            '비밀번호 초기화',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
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

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
