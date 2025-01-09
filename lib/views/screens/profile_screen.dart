import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/viewmodels/profile_view_model.dart';
import 'package:support_flutter/viewmodels/sign_up_view_model.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileViewModelProvider);
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
                  '내 정보',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: const Color(0xFF111111),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 52.w,
                  height: 52.h,
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: state.when(
            data: (profile) {
              return Container(
                margin: EdgeInsets.only(top: 12.h),
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 102.h,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(8.w, 10.h, 8.w, 10.h),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFBFBFBF),
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: Row(
                          children: <Widget>[
                            ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(41.r), // Image radius
                                child: Image.network(
                                    'https://21gram.blog/wp-content/uploads/2023/09/%ED%96%84%EC%8A%A4%ED%84%B0-%EC%A3%BD%EA%B8%B0-%EC%A0%84-%EC%A6%9D%EC%83%81-%ED%96%84%EC%8A%A4%ED%84%B0-%EC%88%98%EB%AA%85-%ED%96%84%EC%8A%A4%ED%84%B0-%EC%9E%A5%EB%A1%80-%ED%96%84%EC%8A%A4%ED%84%B0-%ED%8A%B9%EC%A7%95-%ED%96%84%EC%8A%A4%ED%84%B0-%EA%B2%A8%EC%9A%B8%EC%9E%A0-1024x678.jpg',
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              width: 21.w,
                            ),
                            Table(
                              columnWidths: const {
                                0: IntrinsicColumnWidth(),
                                1: IntrinsicColumnWidth(),
                                2: IntrinsicColumnWidth(),
                              },
                              children: [
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        '닉네임',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF727272),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        ' | ',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w200,
                                          color: const Color(0xFF727272),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        profile!.data!.nickname,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        '성별',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF727272),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        ' | ',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w200,
                                          color: const Color(0xFF727272),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        genderSymbolToKoreanMap[
                                            profile.data!.gender]!,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        '기숙사',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF727272),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        ' | ',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w200,
                                          color: const Color(0xFF727272),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        dormTypeSymbolToKoreanMap[
                                            profile.data!.dormType]!,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: OutlinedButton(
                        onPressed: () => context.go('/profile/edit'),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: accentColor,
                          foregroundColor: mainColor,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          '내 정보 수정하기',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (error, stackTrace) {
              return Text(stackTrace.toString());
            },
            loading: () {
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
