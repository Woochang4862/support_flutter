import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/routers/router.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: SupportApp(),
    ),
  );
}

class SupportApp extends ConsumerWidget {
  const SupportApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = ThemeData();
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: theme.colorScheme.copyWith(secondary: Color(0xFF4F7BD0)),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: ref.read(routerProvider),
    );
  }
}
