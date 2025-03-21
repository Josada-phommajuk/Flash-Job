import 'package:flash_job/feature/presentation/pages/getstart/pages/getstart_page.dart';
import 'package:flash_job/feature/presentation/pages/homescreen/pages/home_page.dart';
import 'package:flash_job/feature/presentation/pages/list_screen/clean_list/presentation/pages/clean_service_list_page.dart';
import 'package:flash_job/feature/presentation/pages/login/feature/profile/presentation/pages/login_page.dart';
import 'package:flash_job/feature/presentation/pages/onboarding/pages/onboarding_page.dart';
import 'package:flash_job/feature/presentation/pages/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../feature/presentation/pages/login/feature/address/presentation/pages/address_input_page.dart';
import '../../feature/presentation/pages/login/feature/phone_number/presentation/pages/phone_number_page.dart';
import '../../feature/presentation/pages/update_form/presentation/pages/edit_profile_page.dart';


// ລະອຽດປານນີ້ ເດັກນ້ອຍອະນຸບານກະແກ້ໄດ້ > _ <

class RouteManager {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: '/getstart',
        builder: (context, state) => GetStartedPage(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/phone-number',
        builder: (context, state) => PhoneNumberPage(),
      ),
      GoRoute(
        path: '/address',
        builder: (context, state) => AddressInputPage(),
      ),
      GoRoute(
        path: '/update',
        builder: (context, state) => EditProfilePage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/list',
        builder: (context, state) => CleanServiceListPage(),
      ),
    ],
  );
}