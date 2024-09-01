import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:support_flutter/views/widgets/rounded_text_field.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  TextEditingController portalIdController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  TextEditingController nickNameController = TextEditingController();

  bool passwordVisible = false;
  bool passwordConfirmVisible = false;

  bool codeVerified = false;

  @override
  Widget build(BuildContext context) {
    portalIdController.addListener(() {
      setState(() {
        codeVerified = false;
      });
    });

    passwordController.addListener(() {});

    passwordConfirmController.addListener(() {});

    nickNameController.addListener(() {});

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
                        '회원가입',
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
                  margin: EdgeInsets.only(top: 60.h),
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RoundedTextField(
                        height: 50.h,
                        textInputAction: TextInputAction.next,
                        textEditController: portalIdController,
                        leftBottomCornerRadius: 0.r,
                        rightBottomCornerRadius: 0.r,
                        leftTopCornerRadius: 8.r,
                        rightTopCornerRadius: 8.r,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        textAlign: TextAlign.left,
                        hintText: '포털 아이디',
                        borderColor:
                            idIsInvalid(null) ? const Color(0xFFFF3F3F) : null,
                        isAnimatedHint: false,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_person.svg',
                          width: 13.w,
                          height: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        suffixIcon: Container(
                          margin: EdgeInsets.only(
                              top: 8.h, bottom: 8.h, right: 8.w),
                          width: 83.w,
                          //height: 38.h, //not working -> margin으로 높이 조절
                          child: OutlinedButton(
                            onPressed: null != null ? null : () async {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF4F7BD0),
                              side: const BorderSide(
                                width: 0.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(16.r), // radius 18
                              ),
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              '전송',
                              style: TextStyle(
                                color: const Color(0xFFFFFFFF),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF989898),
                        ),
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textInputAction: TextInputAction.next,
                        textEditController: codeController,
                        leftBottomCornerRadius: 8.r,
                        rightBottomCornerRadius: 8.r,
                        leftTopCornerRadius: 0.r,
                        rightTopCornerRadius: 0.r,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        textAlign: TextAlign.left,
                        hintText: '인증코드 입력',
                        borderColor:
                            idIsInvalid(null) ? const Color(0xFFFF3F3F) : null,
                        isAnimatedHint: false,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_password.svg',
                          width: 13.w,
                          height: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        suffixIcon: Container(
                          margin: EdgeInsets.only(
                              top: 8.h, bottom: 8.h, right: 8.w),
                          width: 83.w,
                          child: OutlinedButton(
                            onPressed: null != null ? null : () async {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF767676),
                              side: const BorderSide(
                                width: 0.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(16.r), // radius 18
                              ),
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              '확인',
                              style: TextStyle(
                                color: const Color(0xFFFFFFFF),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF989898),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textEditController: passwordController,
                        leftBottomCornerRadius: 0.r,
                        rightBottomCornerRadius: 0.r,
                        leftTopCornerRadius: 8.r,
                        rightTopCornerRadius: 8.r,
                        borderColor:
                            pwIsInvalid(null) ? const Color(0xFFFF3F3F) : null,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        obscureText: !passwordVisible,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                        hintText: '문자,숫자,특수문자 포함 8~20자',
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
                              passwordVisible = !passwordVisible;
                            });
                          },
                          icon: SvgPicture.asset(
                            passwordVisible
                                ? 'assets/images/ic_eye_open.svg'
                                : 'assets/images/ic_eye_slash.svg',
                            width: 25.w,
                            height: 25.h,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF989898),
                        ),
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textEditController: passwordConfirmController,
                        leftBottomCornerRadius: 0.r,
                        rightBottomCornerRadius: 0.r,
                        leftTopCornerRadius: 0.r,
                        rightTopCornerRadius: 0.r,
                        borderColor: pwConfirmIsInvalid(null)
                            ? const Color(0xFFFF3F3F)
                            : null,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        obscureText: !passwordConfirmVisible,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                        hintText: '비밀번호 확인',
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
                              passwordConfirmVisible = !passwordConfirmVisible;
                            });
                          },
                          icon: SvgPicture.asset(
                            passwordConfirmVisible
                                ? 'assets/images/ic_eye_open.svg'
                                : 'assets/images/ic_eye_slash.svg',
                            width: 25.w,
                            height: 25.h,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF989898),
                        ),
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textInputAction: TextInputAction.done,
                        textEditController: nickNameController,
                        leftBottomCornerRadius: 8.r,
                        rightBottomCornerRadius: 8.r,
                        leftTopCornerRadius: 0.r,
                        rightTopCornerRadius: 0.r,
                        borderColor: nickNameIsInvalid(null)
                            ? const Color(0xFFFF3F3F)
                            : null,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        textAlign: TextAlign.left,
                        hintText: '닉네임',
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
                      SizedBox(
                        height: 8.h,
                      ),
                      Visibility(
                        visible: true,
                        child: Text(
                          getErrorMessage(null),
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFFFF3F3F),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 179.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                          onPressed: null != null
                              ? null
                              : () async {
                                  if (codeVerified) {
                                  } else {
                                    // 아이디 중복확인 필요
                                    showAlertDialog(
                                        context, '아이디 중복확인이 필요합니다.');
                                  }
                                },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFF000000),
                            side: const BorderSide(
                              width: 0.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            '회원가입 완료하기',
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 19.w),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "회원가입 시 ",
                            style: TextStyle(
                                fontFamily: 'Pretendard-Regular',
                                fontSize: 12.sp,
                                color: const Color(0xFF989898),
                                fontWeight: FontWeight.w400),
                            children: const [
                              TextSpan(
                                text: "서비스 이용약관 ",
                                style: TextStyle(
                                    color: Color(0xFF6E6EDE),
                                    fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: '및 ',
                              ),
                              TextSpan(
                                text: "개인정보 처리방침",
                                style: TextStyle(
                                    color: Color(0xFF6E6EDE),
                                    fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: '에 동의하신 것으로 간주됩니다',
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

  bool idIsInvalid(String? state) {
    // if (state is SignUpModelError) {
    //   switch (state.code) {
    //     case "USR-207":
    //     case "USR-F100":
    //       return true;
    //   }
    // }
    return false;
  }

  bool pwIsInvalid(String? state) {
    // if (state is SignUpModelError) {
    //   switch (state.code) {
    //     case "USR-F200":
    //       return true;
    //   }
    // }
    return false;
  }

  bool pwConfirmIsInvalid(String? state) {
    // if (state is SignUpModelError) {
    //   switch (state.code) {
    //     case "USR-F300":
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

  String getErrorMessage(String? state) {
    // if (state is SignUpModelError) {
    //   logger.d(state.code);
    //   switch (state.code) {
    //     case "USR-207":
    //       return "* 이미 존재하는 아이디입니다!";
    //     case "USR-212": // 새 비밀번호 확인 불일치
    //       return "* 비밀번호가 일치하지 않습니다!";
    //     case "USR-F100": // 아이디 규칙 X
    //       return "* 아이디는 5~20자 이내 숫자,문자만 가능합니다!";
    //     case "USR-F200": // 비밀번호 규칙 X
    //       return "* 비밀번호는 5~20자 이내 숫자,문자,특수문자만 가능합니다!";
    //     case "USR-F300": // 비밀번호 일치 X
    //       return "* 비밀번호가 일치하지 않습니다!";
    //     case "USR-F400": // 이름 공백
    //       return "* 이름이 형식에 맞지 않습니다!";
    //     case "USR-F500": // 전화번호 형식에 맞지 않음
    //       return "* 전화번호가 형식에 맞지 않습니다!";
    //     case "USR-F600": // 학번이 공백 혹은 8자리가 아님
    //       return "* 학번이 형식에 맞지 않습니다!";
    //     case "USR-F700": // 학과가 선택되지 않음
    //       return "* 단과대학/학과를 선택해주세요!";
    //     default:
    //       return "";
    //   }
    // }
    return "";
  }

  @override
  void dispose() {
    portalIdController.dispose();
    codeController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    nickNameController.dispose();
    super.dispose();
  }
}
