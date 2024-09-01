import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/views/widgets/rounded_text_field.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  TextEditingController nickNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.addListener(() {});

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
                        '내 정보 수정',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: const Color(0xFF111111),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 56.w,
                        height: 40.h,
                        child: Container(
                          margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          width: 83.w,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF4F7BD0),
                              surfaceTintColor: const Color(0xFF4F7BD0),
                              foregroundColor: Colors.white,
                              side: BorderSide(
                                  width: 0,
                                ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {},
                            child: Text(
                              '완료',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 25.h),
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 126.w,
                        height: 126.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(63.r),
                        ),
                        child: Center(
                          child: Image(
                            image: AssetImage(
                                "assets/images/profile_image_sample.png"),
                            width: 89.w,
                            height: 89.h,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textInputAction: TextInputAction.next,
                        textEditController: nickNameController,
                        leftBottomCornerRadius: 8.r,
                        rightBottomCornerRadius: 8.r,
                        leftTopCornerRadius: 8.r,
                        rightTopCornerRadius: 8.r,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        textAlign: TextAlign.left,
                        hintText: '닉네임',
                        borderColor: nickNameIsInvalid(null)
                            ? const Color(0xFFFF3F3F)
                            : null,
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
                      RoundedTextField(
                        height: 50.h,
                        textInputAction: TextInputAction.next,
                        textEditController: nameController,
                        leftBottomCornerRadius: 8.r,
                        rightBottomCornerRadius: 8.r,
                        leftTopCornerRadius: 8.r,
                        rightTopCornerRadius: 8.r,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        textAlign: TextAlign.left,
                        hintText: '이름',
                        borderColor: nameIsInvalid(null)
                            ? const Color(0xFFFF3F3F)
                            : null,
                        isAnimatedHint: false,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_stylus_outline.svg',
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
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                          onPressed: () =>
                              context.go('/profile/edit/change_pw'),
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
                                fontSize: 14.sp,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 185.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFFA2A2A2),
                            foregroundColor: const Color(0xFFFFFFFF),
                            side: const BorderSide(
                              width: 0.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            '회원탈퇴',
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w600),
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

  bool nameIsInvalid(String? state) {
    // if (state is SignUpModelError) {
    //   switch (state.code) {
    //     case "USR-207":
    //     case "USR-F100":
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

  @override
  void dispose() {
    nickNameController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
