import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = null;

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
                        borderColor: currentPWIsInvalid(state)
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
                        borderColor: newPWIsInvalid(state)
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
                      RichText(
                        text: TextSpan(
                          text: '* 비밀번호는 ',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFF989898),
                          ),
                          children: const [
                            TextSpan(
                              text: '6~20자',
                              style: TextStyle(
                                color: Color(0xFF4F7BD0),
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
                        borderColor: newPWConfirmIsInvalid(state)
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
                      Visibility(
                        visible: state != null,
                        child: Text(
                          getErrorMessage(state),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xFFFF3F3F),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 230.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                          onPressed: state != null
                              ? null
                              : () async {
                                  // 공백이 아닌지 확인
                                  // 비밀번호 규칙 체크
                                  final currentPW =
                                      currentPWController.text.trim();
                                  final newPW = newPWController.text.trim();
                                  final newPWConfirm =
                                      newPWConfirmController.text.trim();
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

  String getErrorMessage(String? state) {
    // if (state is ChangePWModelError) {
    //   switch (state.code) {
    //     // 모바일 에러코드
    //     case "USR-F900": // 현재 비밀번호 공백
    //       return "* 현재 비밀번호를 입력해주세요!";
    //     case "USR-F200":
    //       return "* 비밀번호는 문자, 숫자를 포함한 6~20 이내로 작성해주세요!";
    //     case "USR-F300":
    //       return "* 비밀번호가 일치하지 않습니다!";
    //     // 서버 에러코드
    //     case "USR-204": // 현재 비밀번호 불일치
    //       return "현재 비밀번호가 일치하지 않습니다";
    //     case "USR-202": // 새 비밀번호 확인 불일치
    //     case "USR-212": // 새 비밀번호 확인 불일치
    //       return "* 비밀번호가 일치하지 않습니다!";
    //     case "USR-203": // 새 비밀번호 빈칸
    //       return "* 비밀번호는 문자, 숫자를 포함한 6~20 이내로 작성해주세요!";
    //     case "USR-210": // 해당 정보로 인증 중인 회원존재 X
    //     default:
    //       return "* 비밀번호를 변경하는 데 잠시 문제가 생겼습니다. 잠시후에 다시 시도해주세요!";
    //   }
    // }
    return "";
  }

  bool currentPWIsInvalid(String? state) {
    // if (state is ChangePWModelError) {
    //   switch (state.code) {
    //     case "USR-F900":
    //       return true;
    //   }
    // }
    return false;
  }

  bool newPWIsInvalid(String? state) {
    // if (state is ChangePWModelError) {
    //   switch (state.code) {
    //     case "USR-F200":
    //       return true;
    //   }
    // }
    return false;
  }

  bool newPWConfirmIsInvalid(String? state) {
    // if (state is ChangePWModelError) {
    //   switch (state.code) {
    //     case "USR-F300":
    //       return true;
    //   }
    // }
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
