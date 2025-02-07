import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/viewmodels/notice_view_model.dart';

class RefreshObserver extends NavigatorObserver {
  RefreshObserver({required this.ref});

  final Ref ref;

  @override
  void didPop(Route route, Route? previousRoute) async {
    if (previousRoute?.settings.name == '/') {
      logger.d('didPop - called!');
      await ref.read(noticeViewModelProvider.notifier).fetchNotices();
    }
    super.didPop(route, previousRoute);
  }
}
