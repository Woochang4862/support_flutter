import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/models/user_model.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/viewmodels/login_view_model.dart';
import 'package:support_flutter/views/widgets/rounded_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController portalIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginViewModelProvider);
    ref.listen(loginViewModelProvider, (previous, next) {
      logger.d(next);
    });
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Padding(
            padding: EdgeInsets.only(
                left: 22.w, right: 22.w), // icon에 10.w 정도의 여백이 기본적으로 존재
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
                  '로그인',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: const Color(0xFF111111),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 52.w, height: 52.h)
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 30.h),
            padding: EdgeInsets.only(left: 32.w, right: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 50.h,
                  child: RoundedTextField(
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
                    isAnimatedHint: false,
                    prefixIcon: SvgPicture.asset(
                      'assets/images/ic_person.svg',
                      width: 13.w,
                      height: 16.h,
                      fit: BoxFit.scaleDown,
                    ),
                    hintStyle: TextStyle(
                        fontSize: 14.sp, color: const Color(0xFF989898)),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  child: RoundedTextField(
                    textEditController: passwordController,
                    leftBottomCornerRadius: 8.r,
                    rightBottomCornerRadius: 8.r,
                    leftTopCornerRadius: 0.r,
                    rightTopCornerRadius: 0.r,
                    borderWidth: 1.w,
                    maxLines: 1,
                    textInputType: TextInputType.text,
                    obscureText: !passwordVisible,
                    textAlign: TextAlign.left,
                    hintText: '비밀번호',
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
                ),
                SizedBox(
                  height: 8.h,
                ),
                Visibility(
                  visible: false,
                  child: Text(
                    getErrorMessage(null),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFFFF3F3F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 62.h,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: OutlinedButton(
                    onPressed: state is UserModelLoading
                        ? null
                        : () async {
                            final id = portalIdController.text.trim(),
                                password = passwordController.text.trim();
                            logger.d('id:$id / pw:$password');
                            await ref
                                .read(loginViewModelProvider.notifier)
                                .login(
                                  id: id,
                                  password: password,
                                );
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
                      '로그인',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.go('/login/find_pw');
                      },
                      child: Text(
                        '비밀번호 찾기',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 0.5.w,
                      height: 12.h,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.go('/login/sign_up');
                      },
                      child: Text(
                        '회원가입',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getErrorMessage(String? state) {
    if (state != null) {
      switch (state) {
        case "USR-F800": // 아이디 혹은 비밀번호 공백
          return "* 아이디와 비밀번호를 입력해주세요!";
        case "USR-211":
          return "* 올바르지 않은 아이디 혹은 비밀번호입니다";
        default:
          return "* 로그인 중에 문제가 발생했습니다";
      }
    }
    return "* 테스트테스트테스트테스트테스트";
  }
}
