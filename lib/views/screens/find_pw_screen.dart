import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/views/widgets/rounded_text_field.dart';

class FindPwScreen extends ConsumerStatefulWidget {
  const FindPwScreen({Key? key}) : super(key: key);

  @override
  _FindPwScreenState createState() => _FindPwScreenState();
}

class _FindPwScreenState extends ConsumerState<FindPwScreen> {
  final TextEditingController portalIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    portalIdController.addListener(
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
                          textEditController: portalIdController,
                          leftBottomCornerRadius: 8.r,
                          rightBottomCornerRadius: 8.r,
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
                            fontSize: 14.sp,
                            color: const Color(0xFF989898),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 116.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                          onPressed: null != null ? null : () async {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFF4F4F4F),
                            side: const BorderSide(
                              width: 0.0,
                            ),
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
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                          onPressed: () {
                            final encodedUrl = Uri.encodeComponent(
                                'https://mail.suwon.ac.kr:10443/m/index.jsp');

                            context
                                .push('/login/find_pw/webview/${encodedUrl}');
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFF4F4F4F),
                            side: const BorderSide(
                              width: 0.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            '포털로 이동하기',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                          onPressed: () => context.go('/login'),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFF4F7BD0),
                            side: const BorderSide(
                              width: 0.0,
                            ),
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
    portalIdController.dispose();
    super.dispose();
  }
}
