import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/models/change_pw_model.dart';
import 'package:support_flutter/utils/error_util.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/viewmodels/change_pw_view_model.dart';
import 'package:support_flutter/views/widgets/rounded_text_field.dart';

class ChangePwScreen extends ConsumerStatefulWidget {
  const ChangePwScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangePwScreenState();
}

class _ChangePwScreenState extends ConsumerState<ChangePwScreen> {
  TextEditingController currentPWController = TextEditingController();
  TextEditingController newPWController = TextEditingController();
  TextEditingController newPWConfirmController = TextEditingController();

  bool currentPWVisible = false;
  bool newPWVisible = false;
  bool newPWConfirmVisible = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(changePWViewModelProvider);
    ref.listen(changePWViewModelProvider, (prev, next) {
      logger.d(next);
      next.when(
          data: (data) {
            switch (data?.type) {
              case ChangePWModelType.changePW:
                context.go('/');
                break;
              default:
            }
          },
          error: (error, stackTrace) {},
          loading: () {});
    });
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
                        '비밀번호 변경',
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
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 14.h),
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '현재 비밀번호',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF989898),
                        ),
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textEditController: currentPWController,
                        leftBottomCornerRadius: 8.r,
                        rightBottomCornerRadius: 8.r,
                        leftTopCornerRadius: 8.r,
                        rightTopCornerRadius: 8.r,
                        borderColor: currentPWIsInvalid(state.error)
                            ? const Color(0xFFFF3F3F)
                            : null,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        obscureText: !currentPWVisible,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                        hintText: '비밀번호 입력',
                        isAnimatedHint: false,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_password.svg',
                          width: 13.w,
                          height: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              currentPWVisible = !currentPWVisible;
                            });
                          },
                          icon: SvgPicture.asset(
                            currentPWVisible
                                ? 'assets/images/ic_eye_open.svg'
                                : 'assets/images/ic_eye_slash.svg',
                            width: 25.w,
                            height: 25.h,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF989898),
                        ),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Text(
                        '새로운 비밀번호',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF989898),
                        ),
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textEditController: newPWController,
                        leftBottomCornerRadius: 8.r,
                        rightBottomCornerRadius: 8.r,
                        leftTopCornerRadius: 8.r,
                        rightTopCornerRadius: 8.r,
                        borderColor: newPWIsInvalid(state.error)
                            ? const Color(0xFFFF3F3F)
                            : null,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        obscureText: !newPWVisible,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                        hintText: '비밀번호 입력',
                        isAnimatedHint: false,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_password.svg',
                          width: 13.w,
                          height: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              newPWVisible = !newPWVisible;
                            });
                          },
                          icon: SvgPicture.asset(
                            newPWVisible
                                ? 'assets/images/ic_eye_open.svg'
                                : 'assets/images/ic_eye_slash.svg',
                            width: 25.w,
                            height: 25.h,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF989898),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '* 영문, 숫자, 특수 문자를 포함한 ',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFF989898),
                          ),
                          children: const [
                            TextSpan(
                              text: '5~20자',
                              style: TextStyle(
                                color: accentColor,
                              ),
                            ),
                            TextSpan(text: ' 내로 입력해 주세요.'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Text(
                        '새로운 비밀번호 확인',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF989898),
                        ),
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textEditController: newPWConfirmController,
                        leftBottomCornerRadius: 8.r,
                        rightBottomCornerRadius: 8.r,
                        leftTopCornerRadius: 8.r,
                        rightTopCornerRadius: 8.r,
                        borderColor: newPWConfirmIsInvalid(state.error)
                            ? const Color(0xFFFF3F3F)
                            : null,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        obscureText: !newPWConfirmVisible,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                        hintText: '비밀번호 입력',
                        isAnimatedHint: false,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_password.svg',
                          width: 13.w,
                          height: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              newPWConfirmVisible = !newPWConfirmVisible;
                            });
                          },
                          icon: SvgPicture.asset(
                            newPWConfirmVisible
                                ? 'assets/images/ic_eye_open.svg'
                                : 'assets/images/ic_eye_slash.svg',
                            width: 25.w,
                            height: 25.h,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF989898),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      state.hasError
                          ? Text(
                              "* ${ErrorUtil.instance.getErrorMessage((state.error as ChangePWModelError).code) ?? ""}",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFFFF3F3F),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 230.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                          onPressed: state.isLoading
                              ? null
                              : () async {
                                  final currentPW =
                                      currentPWController.text.trim();
                                  final newPW = newPWController.text.trim();
                                  final newPWConfirm =
                                      newPWConfirmController.text.trim();

                                  ref
                                      .read(changePWViewModelProvider.notifier)
                                      .changePW(
                                        currentPassword: currentPW,
                                        newPassword: newPW,
                                        newPasswordConfirm: newPWConfirm,
                                      );
                                },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFF000000),
                            foregroundColor: const Color(0xFFFFFFFF),
                            side: const BorderSide(
                              width: 0.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            '비밀번호 변경',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  bool currentPWIsInvalid(Object? error) {
    if (error is ChangePWModelError) {
      switch (error.code) {
        case "ERR112":
        case "USR-F302":
          return true;
      }
    }
    return false;
  }

  bool newPWIsInvalid(Object? error) {
    if (error is ChangePWModelError) {
      switch (error.code) {
        case "ERR108":
        case "USR-F300":
          return true;
      }
    }
    return false;
  }

  bool newPWConfirmIsInvalid(Object? error) {
    if (error is ChangePWModelError) {
      switch (error.code) {
        case "USR-F301":
          return true;
      }
    }
    return false;
  }

  void showAlertDialog(
      BuildContext context, String text, Function()? onConfirmPressed) async {
    // await showDialog(
    //     context: context,
    //     builder: (_) => AlertTextDialog(
    //           text: text,
    //           onConfirmPressed: () async {
    //             Navigator.of(context).pop();
    //             if (onConfirmPressed != null) {
    //               await onConfirmPressed();
    //             }
    //           },
    //         ));
  }
}
