import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/routers/router.dart';
import 'package:support_flutter/utils/icons/support_app_icons.dart';
import 'package:support_flutter/views/screens/community_screen.dart';
import 'package:support_flutter/views/screens/delivery_screen.dart';
import 'package:support_flutter/views/screens/laundary_screen.dart';
import 'package:support_flutter/views/screens/notice_screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  var _index = 0;
  static const List _pages = [
    NoticeScreen(),
    LaundaryScreen(),
    DeliveryScreen(),
    CommunityScreen(),
  ];
  static const List _titles = [
    "공지사항",
    "생활편의",
    "공동배달",
    "커뮤니티",
  ];
  final Map<String, Function(BuildContext)> _logOutMenu = {
    "로그인": (context) {
      context.go('/login');
    },
  };
  final Map<String, Function(BuildContext)> _logInMenu = {
    "내 정보": (context) {
      context.go('/profile');
    },
    "문의하기": (context) {
      context.go('/contact');
    },
    "개인정보 동의": (context) {
      context.go('/policy');
    },
    "로그아웃": (context) {},
  };
  Map<String, Function(BuildContext)> _currentMenu = {};

  @override
  void initState() {
    _currentMenu = _logOutMenu;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          scrolledUnderElevation: 0,
          title: Text(
            _titles[_index],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          ),
        ),
        drawer: Drawer(
          width: 232.w,
          backgroundColor: const Color(0xFFF5F5F5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
          ),
          child: ListView.separated(
            itemCount: _currentMenu.keys.length,
            itemBuilder: (context, index) {
              return Ink(
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    _currentMenu.entries.toList()[index].value(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 32.w),
                    height: 40.h,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _currentMenu.keys.toList()[index],
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                thickness: 0.5.h,
                height: 0.6.h,
              );
            },
            padding: EdgeInsets.only(top: 98.h),
          ),
        ),
        body: _pages[_index],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                blurRadius: 0.1,
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _index,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedIconTheme: const IconThemeData(color: Color(0xFFA7A7A7)),
            selectedIconTheme: const IconThemeData(color: Color(0xFF4F7BD0)),
            selectedItemColor: const Color(0xFF4F7BD0),
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(BottomBarIcons.ic_baseline_home),
                label: '공지사항',
              ),
              BottomNavigationBarItem(
                icon: Icon(BottomBarIcons.ic_baseline_search),
                label: '생활편의',
              ),
              BottomNavigationBarItem(
                icon: Icon(BottomBarIcons.mingcute_bike_line),
                label: '공동배달',
              ),
              BottomNavigationBarItem(
                icon: Icon(BottomBarIcons.chat_bubble_outline),
                label: '커뮤니티',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
