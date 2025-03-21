// Add this to your pubspec.yaml file under dependencies:
// google_mobile_ads: ^3.0.0

// main.dart updates:
import 'package:flash_job/core/utils/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // ໂຄສະນາ
  await MobileAds.instance.initialize();
  
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
        // ເພິ່ມພາສາບ່ອນນີ້ຢາກໄດ້ພາສາໃດເພິ່ມໃສ່ ຢ່າລືມໄປເພື່ອມ json ນຳ
      ],
      path: 'assets/translations', // ອັນນີ້ import 
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
      routerConfig: RouteManager.router, //ຢ່າໄປກວນມັນຢາກ ລັນ ຫນ້າໃດໄປແປງຢູ່ route_manager.dart 
    );
  }
}