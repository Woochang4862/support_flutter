import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class NoticeDetailScreen extends ConsumerStatefulWidget {
  const NoticeDetailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NoticeDetailScreenState();
}

class _NoticeDetailScreenState extends ConsumerState<NoticeDetailScreen> {
  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  width: 52.w,
                  height: 52.h,
                )
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 16.h),
                    padding: EdgeInsets.only(
                      left: 44.w,
                      right: 44.w,
                      bottom: 100.h, // image height size 만큼 올려줘야함
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'test',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Divider(thickness: 1.h,),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          '기간 | 2024-08-16 ~ 2024-09-16',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          '내용~~~~~~~~~~',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    height: 100.h,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // 가로 방향으로 스크롤
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.push('/image',
                                extra: []);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ), // 이미지 사이의 여백
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(8.0), // 모서리를 둥글게 설정
                              child: Image.network(
                                'https://i.namu.wiki/i/WrBkC46qpdq4FbzMbbPpP8-7VCtuvvaapDjBf4rsmdAdK8M5xrkhq-zwM2qZLzoOrdQSjV1pabBCIAPJpCDKcnLzHhSbxIRD67yfJ-ZGRRG8CanGS2wNrCJQa72L-NJ2Kjh4svdcznJo4376pU007g.webp',
                                fit: BoxFit.cover, // 이미지를 박스에 맞게 채움
                                width: 100.w, // 이미지의 너비
                                // height: 100.h, // 이미지의 높이
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
