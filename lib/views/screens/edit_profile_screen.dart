import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/models/profile_model.dart';
import 'package:support_flutter/utils/dialog_manager.dart';
import 'package:support_flutter/utils/icons/sign_up_icons_icons.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/viewmodels/profile_view_model.dart';
import 'package:support_flutter/views/widgets/rounded_dropdown.dart';
import 'package:support_flutter/views/widgets/rounded_text_field.dart';
import 'package:support_flutter/views/widgets/text_font_widget.dart';
import 'package:support_flutter/utils/extensions.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  TextEditingController nickNameController = TextEditingController();

  DormType? selectedDorm;
  GenderType? selectedGender;

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileViewModelProvider);

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
                              backgroundColor: accentColor,
                              surfaceTintColor: accentColor,
                              foregroundColor: mainColor,
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: profileState.isLoading
                                ? null
                                : () async {
                                    final nickname =
                                        nickNameController.text.trim();
                                    if (selectedDorm != null &&
                                        selectedGender != null) {
                                      await ref
                                          .read(
                                              profileViewModelProvider.notifier)
                                          .update(
                                              nickname: nickname,
                                              gender: selectedGender!,
                                              dormType: selectedDorm!);
                                      await ref
                                          .read(
                                              profileViewModelProvider.notifier)
                                          .fetch();
                                    } else {
                                      DialogManager.instance.showAlertDialog(
                                          context: context,
                                          content: '정보를 입력해주시기 바랍니다.');
                                    }
                                  },
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
                child: profileState.when(data: (data) {
                  nickNameController.text = data!.data!.nickname;
                  selectedDorm = DormType.fromCode(data.data!.dormType);
                  selectedGender = GenderType.fromCode(data.data!.gender);
                  return Container(
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
                          readOnly: true,
                          leftBottomCornerRadius: 8.r,
                          rightBottomCornerRadius: 8.r,
                          leftTopCornerRadius: 8.r,
                          rightTopCornerRadius: 8.r,
                          borderWidth: 1.w,
                          maxLines: 1,
                          textInputType: TextInputType.text,
                          textAlign: TextAlign.left,
                          hintText: '비밀번호',
                          borderColor: nameIsInvalid(null)
                              ? const Color(0xFFFF3F3F)
                              : null,
                          isAnimatedHint: false,
                          prefixIcon: Icon(
                            SignUpIcons.ic_lock,
                            size: 13.w,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFF989898),
                          ),
                          suffixIcon: Container(
                            margin: EdgeInsets.only(
                                top: 8.h, bottom: 8.h, right: 8.w),
                            width: 88.w,
                            //height: 38.h, //not working -> margin으로 높이 조절
                            child: OutlinedButton(
                              onPressed: () {
                                context.go('/profile/edit/change_pw');
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Color(0xFFFFFFFF),
                                backgroundColor: Color(0xFF4f4f4f),
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(4.r), // radius 18
                                ),
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                              ),
                              child: TextFontWidget.fontRegular(
                                '비밀번호 변경',
                                color: const Color(0xFFFFFFFF),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        RoundedDropdown(
                          height: 48.h,
                          items: GenderType.values.toDropdownItems(),
                          onChanged: (String? newValue) {
                            selectedGender = GenderType.fromKorean(newValue!);
                            logger.d(selectedGender);
                          },
                          itemIconSize: 12.w,
                          initValue: selectedGender!.korean,
                          hintText: '성별',
                          leftTopCornerRadius: 8.r,
                          rightTopCornerRadius: 8.r,
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
                          height: 8.h,
                        ),
                        RoundedDropdown(
                          height: 48.h,
                          maxHeight: 130.h,
                          itemIconSize: 13.w,
                          items: DormType.values.toDropdownItems(),
                          onChanged: (String? newValue) {
                            selectedDorm = DormType.fromKorean(newValue!);
                            logger.d(selectedDorm);
                          },
                          initValue: selectedDorm!.korean,
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
                          height: 185.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 56.h,
                          child: OutlinedButton(
                            onPressed: () {
                              DialogManager.instance.showAlertDialog(
                                context: context,
                                title: '정말 탈퇴하시겠습니까?',
                                content:
                                    '탈퇴하기 버튼 선택시 계정 복구가 어려우니\n신중하게 선택해 주시기 바랍니다.',
                                leftButtonText: '취소',
                                rightButtonText: '탈퇴',
                                onRightButtonPressed: () {},
                                onLeftButtonPressed: () {
                                  Navigator.of(context).pop();
                                },
                              );
                            },
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
                  );
                }, error: (error, stackTrace) {
                  return TextFontWidget.fontRegular(stackTrace.toString());
                }, loading: () {
                  return CircularProgressIndicator();
                }),
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
    super.dispose();
  }
}
