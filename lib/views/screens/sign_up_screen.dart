import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/models/sign_up_model.dart';
import 'package:support_flutter/utils/dialog_manager.dart';
import 'package:support_flutter/utils/error_util.dart';
import 'package:support_flutter/utils/icons/sign_up_icons_icons.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/viewmodels/sign_up_view_model.dart';
import 'package:support_flutter/views/widgets/rounded_dropdown.dart';
import 'package:support_flutter/views/widgets/rounded_text_field.dart';
import 'package:support_flutter/views/widgets/text_font_widget.dart';

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

  String? selectedGender;
  String? selectedDorm;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signUpViewModelProvider);
    ref.listen(signUpViewModelProvider, (previous, next) {
      next.when(
        data: (data) {
          switch (data!.type) {
            case SignUpModelType.verifyId:
              DialogManager.instance.showAlertDialog(
                context: context,
                content: '인증코드가 발송되었습니다.',
              );
              break;
            case SignUpModelType.verifyCode:
              codeVerified = true;
              DialogManager.instance.showAlertDialog(
                context: context,
                content: '인증되었습니다.',
              );
              break;
            case SignUpModelType.signUp:
              DialogManager.instance.showAlertDialog(
                context: context,
                content: 'Support 회원가입이 완료되었습니다.',
                leftButtonText: '로그인하러 가기',
                onLeftButtonPressed: () {
                  context.go('/login');
                },
              );
              break;
            default:
          }
        },
        error: (e, stackTrace) {
          e = e as SignUpModelError;
          logger.d(e);
          DialogManager.instance.showAlertDialog(
            context: context,
            content: ErrorUtil.instance.getErrorMessage(e.code),
          );
        },
        loading: () {},
      );
    });

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
              body: SafeArea(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(top: 18.h),
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
                            hintText: '학교 이메일 @suwon.ac.kr',
                            hintStyle: TextFontWidget.fontRegularStyle(
                              color: Color(0xFF989898),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            borderColor: false ? const Color(0xFFFF3F3F) : null,
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
                                onPressed: state.isLoading || codeVerified
                                    ? null
                                    : () async {
                                        codeVerified = false;
                                        final id =
                                            portalIdController.text.trim();
                                        ref
                                            .read(signUpViewModelProvider
                                                .notifier)
                                            .verifyId(
                                              id: id,
                                            );
                                      },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Color(0xFFFFFFFF),
                                  backgroundColor: const Color(0xFFF49446),
                                  side: BorderSide.none,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        16.r), // radius 18
                                  ),
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                ),
                                child: TextFontWidget.fontRegular(
                                  '전송',
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
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
                            borderColor: false ? const Color(0xFFFF3F3F) : null,
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
                                onPressed: state.isLoading || codeVerified
                                    ? null
                                    : () async {
                                        final id =
                                            portalIdController.text.trim();
                                        final code = codeController.text.trim();
                                        ref
                                            .read(signUpViewModelProvider
                                                .notifier)
                                            .verifyCode(
                                              id: id,
                                              code: code,
                                            );
                                      },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Color(0xFFFFFFFF),
                                  backgroundColor: const Color(0xFF767676),
                                  side: BorderSide.none,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        16.r), // radius 18
                                  ),
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                ),
                                child: TextFontWidget.fontRegular(
                                  '확인',
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            hintStyle: TextFontWidget.fontRegularStyle(
                              color: Color(0xFF989898),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
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
                            borderColor: false ? const Color(0xFFFF3F3F) : null,
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
                            hintStyle: TextFontWidget.fontRegularStyle(
                              color: Color(0xFF989898),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          RoundedTextField(
                            height: 50.h,
                            textEditController: passwordConfirmController,
                            leftBottomCornerRadius: 8.r,
                            rightBottomCornerRadius: 8.r,
                            leftTopCornerRadius: 0.r,
                            rightTopCornerRadius: 0.r,
                            borderColor: false ? const Color(0xFFFF3F3F) : null,
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
                                  passwordConfirmVisible =
                                      !passwordConfirmVisible;
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
                            hintStyle: TextFontWidget.fontRegularStyle(
                              color: Color(0xFF989898),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          RoundedTextField(
                            height: 50.h,
                            textInputAction: TextInputAction.next,
                            textEditController: nickNameController,
                            leftBottomCornerRadius: 0.r,
                            rightBottomCornerRadius: 0.r,
                            leftTopCornerRadius: 8.r,
                            rightTopCornerRadius: 8.r,
                            borderColor: false ? const Color(0xFFFF3F3F) : null,
                            borderWidth: 1.w,
                            maxLines: 1,
                            textInputType: TextInputType.text,
                            textAlign: TextAlign.left,
                            hintText: '닉네임',
                            isAnimatedHint: false,
                            prefixIcon: Icon(
                              SignUpIcons.ic_person,
                              size: 13.w,
                            ),
                            hintStyle: TextFontWidget.fontRegularStyle(
                              color: Color(0xFF989898),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          RoundedDropdown(
                            height: 48.h,
                            items: genders,
                            onChanged: (String? newValue) {
                              selectedGender = newValue;
                              setState(() {});
                              logger.d(selectedGender);
                            },
                            itemIconSize: 10.w,
                            initValue: selectedGender,
                            hintText: '성별',
                            leftTopCornerRadius: 0.r,
                            rightTopCornerRadius: 0.r,
                            leftBottomCornerRadius: 8.r,
                            rightBottomCornerRadius: 8.r,
                            borderWidth: 1.w,
                            prefixIcon: Icon(
                              SignUpIcons.ic_gender,
                              size: 13.w,
                            ),
                            hintStyle: TextFontWidget.fontRegularStyle(
                              color: Color(0xFF989898),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          RoundedDropdown(
                            height: 48.h,
                            maxHeight: 130.h,
                            itemIconSize: 13.w,
                            items: dormTypes,
                            onChanged: (String? newValue) {
                              selectedDorm = newValue;
                              setState(() {});
                              logger.d(selectedDorm);
                            },
                            initValue: selectedDorm,
                            hintText: '기숙사 동',
                            leftTopCornerRadius: 8.r,
                            rightTopCornerRadius: 8.r,
                            leftBottomCornerRadius: 8.r,
                            rightBottomCornerRadius: 8.r,
                            borderWidth: 1.w,
                            prefixIcon: Icon(
                              SignUpIcons.ic_dorm,
                              size: 13.w,
                            ),
                            hintStyle: TextFontWidget.fontRegularStyle(
                              color: Color(0xFF989898),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Visibility(
                            visible: true,
                            child: Text(
                              ErrorUtil.instance.getErrorMessage("USR-F700") ??
                                  "",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFFFF3F3F),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 134.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 56.h,
                            child: OutlinedButton(
                              onPressed: state.isLoading
                                  ? null
                                  : () async {
                                      if (codeVerified &&
                                          selectedGender != null &&
                                          selectedDorm != null) {
                                        final id =
                                            portalIdController.text.trim();
                                        final password =
                                            passwordController.text.trim();
                                        final passwordConfirm =
                                            passwordConfirmController.text
                                                .trim();
                                        final nickName =
                                            nickNameController.text.trim();
                                        ref
                                            .read(signUpViewModelProvider
                                                .notifier)
                                            .signUp(
                                              id: id,
                                              password: password,
                                              passwordConfirm: passwordConfirm,
                                              nickname: nickName,
                                              gender: selectedGender!,
                                              dormType: selectedDorm!,
                                            );
                                      } else if (!codeVerified) {
                                        // 아이디 중복확인 필요
                                        DialogManager.instance.showAlertDialog(
                                          context: context,
                                          content: '학교 이메일 인증이 필요합니다!',
                                        );
                                      } else if (selectedGender == null) {
                                        // 성별 선택 필요
                                        DialogManager.instance.showAlertDialog(
                                          context: context,
                                          content: '성별을 선택해주세요!',
                                        );
                                      } else if (selectedDorm == null) {
                                        // 기숙사 동 선택 필요
                                        DialogManager.instance.showAlertDialog(
                                          context: context,
                                          content: '기숙사 동을 선택해주세요!',
                                        );
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
                ),
              ),
            ));
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
