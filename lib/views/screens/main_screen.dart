import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/utils/dialog_manager.dart';
import 'package:support_flutter/utils/icons/menu_icons_icons.dart';
import 'package:support_flutter/utils/icons/support_app_appbar_icons.dart';
import 'package:support_flutter/utils/icons/support_app_icons.dart';
import 'package:support_flutter/viewmodels/user_view_model.dart';
import 'package:support_flutter/views/screens/community_screen.dart';
import 'package:support_flutter/views/screens/delivery_screen.dart';
import 'package:support_flutter/views/screens/laundary_screen.dart';
import 'package:support_flutter/views/screens/notice_screen.dart';
import 'package:support_flutter/views/screens/schedule_screen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:support_flutter/views/widgets/text_font_widget.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

typedef Menu = ({
  IconData icon,
  Function(BuildContext context, WidgetRef ref) routeFunc,
});

class _MainScreenState extends ConsumerState<MainScreen> {
  var _index = 0;
  static const List _pages = [
    ScheduleScreen(),
    LaundaryScreen(),
    DeliveryScreen(),
    CommunityScreen(),
  ];
  static const List _titles = [
    "일정",
    "생활편의",
    "공동배달",
    "커뮤니티",
  ];
  final Map<String, Menu> _logOutMenu = {
    "로그인": (
      icon: MenuIcons.ic_log_in,
      routeFunc: (context, _) {
        context.go('/login');
      },
    ),
  };
  final Map<String, Menu> _logInMenu = {
    "내 정보": (
      icon: MenuIcons.ic_user,
      routeFunc: (context, _) {
        context.go('/profile');
      },
    ),
    "문의하기": (
      icon: MenuIcons.ic_phone,
      routeFunc: (context, _) {
        context.go('/contact');
      },
    ),
    "개인 정보 처리 방침": (
      icon: MenuIcons.ic_shield,
      routeFunc: (context, _) {
        context.go('/privacy_policy');
      },
    ),
    "서비스 이용약관": (
      icon: MenuIcons.ic_file,
      routeFunc: (context, _) {
        context.go('/tems_of_serice');
      },
    ),
    "로그아웃": (
      icon: MenuIcons.ic_log_out,
      routeFunc: (context, ref) {
        DialogManager.instance.showAlertDialog(
          context: context,
          content: 'Support 에서 로그아웃 하시겠습니까?',
          leftButtonText: '취소',
          rightButtonText: '로그아웃',
          onRightButtonPressed: () {
            ref.read(userViewModelProvider.notifier).logout();
          },
        );
      },
    ),
  };
  Map<String, Menu> _currentMenu = {};
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _currentMenu = _logOutMenu;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userViewModelProvider);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          scrolledUnderElevation: 0,
          title: TextFontWidget.fontRegular(
            _titles[_index],
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
          leading: IconButton(
            icon: const Icon(AppBarIcons.ic_menu),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
          actions: [
            badges.Badge(
              badgeStyle: badges.BadgeStyle(
                padding: EdgeInsets.all(3.h),
              ),
              position: badges.BadgePosition.topStart(top: 12.h, start: 15.w),
              child: IconButton(
                icon: Icon(
                  AppBarIcons.ic_notification,
                  size: 22.w,
                ),
                onPressed: () {
                  // context.go('/notice');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NoticeScreen()));
                },
              ),
            )
          ],
        ),
        drawer: Drawer(
          width: 232.w,
          backgroundColor: const Color(0xFFF5F5F5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
          ),
          child: Builder(builder: (context) {
            _currentMenu = userState.value != null ? _logInMenu : _logOutMenu;
            return ListView.separated(
              itemCount: _currentMenu.keys.length,
              itemBuilder: (context, index) {
                return Ink(
                  color: mainColor,
                  child: InkWell(
                    onTap: () {
                      _scaffoldKey.currentState?.closeDrawer();
                      _currentMenu.entries
                          .toList()[index]
                          .value
                          .routeFunc(context, ref);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 32.w),
                      height: 40.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            _currentMenu.entries.toList()[index].value.icon,
                            size: 15.w,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            _currentMenu.keys.toList()[index],
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
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
            );
          }),
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
            selectedIconTheme: const IconThemeData(color: accentColor),
            selectedItemColor: accentColor,
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(BottomBarIcons.ic_baseline_home),
                label: '일정',
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
