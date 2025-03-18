
// First, let's modify main.dart to integrate easy_localization
import 'package:flash_job/core/utils/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('th', 'TH'), // Thai
        Locale('es', 'ES'), // Spanish
        Locale('lo', 'LA'), // Laos
        Locale('ko', 'KR'), // Korea

        // Add more languages as needed
      ],
      path: 'assets/translations', // Path where translation files will be stored
      fallbackLocale: const Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: RouteManager.router,
    );
  }
}
