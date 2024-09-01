import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/views/screens/change_pw_screen.dart';
import 'package:support_flutter/views/screens/contact_screen.dart';
import 'package:support_flutter/views/screens/edit_notice_screen.dart';
import 'package:support_flutter/views/screens/edit_profile.dart';
import 'package:support_flutter/views/screens/find_pw_screen.dart';
import 'package:support_flutter/views/screens/login_screen.dart';
import 'package:support_flutter/views/screens/main_screen.dart';
import 'package:support_flutter/views/screens/notice_detail_screen.dart';
import 'package:support_flutter/views/screens/profile_screen.dart';
import 'package:support_flutter/views/screens/sign_up_screen.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => MainScreen(),
          routes: [
            // LoginScreen
            GoRoute(
              path: 'login',
              builder: (_, __) => LoginScreen(),
              routes: [
                // FindPWScreen
                GoRoute(
                  path: 'find_pw',
                  builder: (_, __) => FindPwScreen(),
                  routes: [
                    // WebViewScreen
                  ],
                ),
                // SignUpScreen
                GoRoute(
                  path: 'sign_up',
                  builder: (_, __) => SignUpScreen(),
                  routes: [
                    // WebViewScreen
                  ],
                ),
              ],
            ),
            // Profile
            GoRoute(
              path: 'profile',
              builder: (_, __) => ProfileScreen(),
              routes: [
                // EditProfile
                GoRoute(
                  path: 'edit',
                  builder: (_, __) => EditProfileScreen(),
                  routes: [
                    // ChangePw
                    GoRoute(
                      path: 'change_pw',
                      builder: (_, __) => ChangePwScreen(),
                    ),
                  ],
                ),
              ],
            ),
            // ContactScreen
            GoRoute(
              path: 'contact',
              builder: (_, __) => ContactScreen(),
            ),
            // PolicyScreen
            GoRoute(
              path: 'policy',
              builder: (_, __) => FindPwScreen(),
            ),
            // NoticeDetailScreen
            GoRoute(
              path: 'notice_detail',
              builder: (context, state) => NoticeDetailScreen(),
            ),
            GoRoute(
              path: 'edit_notice',
              builder: (context, state) => EditNoticeScreen(),
            ),
          ],
        )
      ],
      initialLocation: '/',
      debugLogDiagnostics: true,
    );
  },
);
