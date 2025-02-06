import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/firebase_options.dart';
import 'package:support_flutter/routers/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        scaffoldBackgroundColor: mainColor,
        colorScheme: theme.colorScheme.copyWith(secondary: Color(0xFF4F7BD0)),
        appBarTheme: AppBarTheme(
          backgroundColor: mainColor,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: mainColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: ref.read(routerProvider),
    );
  }
}
