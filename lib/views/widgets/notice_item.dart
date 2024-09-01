import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoticeItem extends StatelessWidget {
  const NoticeItem({
    Key? key,
    required this.title,
    this.onItemClick,
  }) : super(key: key);

  final String title;
  final void Function()? onItemClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onItemClick?.call();
      },
      child: SizedBox(
        height: 43.h,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 7.w,
            vertical: 7.5.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF000000),
                ),
              ),
              Container(
                width: 28.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(63.r),
                ),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/images/profile_image_sample.png"),
                    width: 19.w,
                    height: 19.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
