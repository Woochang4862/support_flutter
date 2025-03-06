import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:support_flutter/routers/refresh_observer.dart';
import 'package:support_flutter/views/screens/change_pw_screen.dart';
import 'package:support_flutter/views/screens/contact_screen.dart';
import 'package:support_flutter/views/screens/edit_notice_screen.dart';
import 'package:support_flutter/views/screens/edit_profile_screen.dart';
import 'package:support_flutter/views/screens/find_pw_screen.dart';
import 'package:support_flutter/views/screens/login_screen.dart';
import 'package:support_flutter/views/screens/main_screen.dart';
import 'package:support_flutter/views/screens/notice_screen.dart';
import 'package:support_flutter/views/screens/policy_screen.dart';
import 'package:support_flutter/views/screens/profile_screen.dart';
import 'package:support_flutter/views/screens/schedule_detail_screen.dart';
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
            GoRoute(
              path: 'schedule_detail/:scheduleId',
              builder: (_, state) => ScheduleDetailScreen(
                scheduleId:
                    int.parse(state.pathParameters['scheduleId'] ?? '0'),
              ),
              routes: [
                // NoticeDetailScreen
                GoRoute(
                  path: 'edit_schedule',
                  builder: (context, state) => EditNoticeScreen(
                    isNotice: false,
                    id: int.parse(state.pathParameters['scheduleId'] ?? '0'),
                  ),
                ),
              ],
            ),
            GoRoute(
              path: 'notice',
              builder: (context, state) => NoticeScreen(),
              routes: [
                // EditNoticeScreen
                GoRoute(
                  path: 'edit_notice',
                  builder: (context, state) => EditNoticeScreen(
                    id: state.extra as int?,
                  ),
                ),
              ],
            ),
            GoRoute(
              path: 'edit_schedule',
              builder: (context, state) => EditNoticeScreen(
                isNotice: false,
                id: state.extra as int?,
              ),
            ),
            GoRoute(
              path: 'terms_of_service',
              builder: (_, __) => PolicyScreen(
                  policyType: PolicyType.termsOfService, isDialog: false),
            ),
            GoRoute(
              path: 'privacy_policy',
              builder: (_, __) => PolicyScreen(
                  policyType: PolicyType.privacyPolicy, isDialog: false),
            ),
            GoRoute(
              path: 'personal_information_collection_and_usage_agreement',
              builder: (_, __) => PolicyScreen(
                  policyType:
                      PolicyType.personalInformationCollectionAndUsageAgreement,
                  isDialog: false),
            ),
          ],
        ),
      ],
      observers: [
        RefreshObserver(ref: ref),
      ],
      initialLocation: '/',
      debugLogDiagnostics: true,
    );
  },
);
