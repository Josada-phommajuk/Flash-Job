import 'package:easy_localization/easy_localization.dart';
import 'package:flash_job/feature/presentation/pages/list_screen/child_list/presentation/pages/child_page.dart';
import 'package:flash_job/feature/presentation/pages/list_screen/clean_list/presentation/pages/clean_service_list_page.dart';
import 'package:flash_job/feature/presentation/pages/list_screen/pet_list/presentation/pages/pet_page.dart';
import 'package:flash_job/feature/presentation/pages/list_screen/repair_list/presentation/pages/repair_page.dart';
import 'package:flash_job/feature/presentation/pages/list_screen/tutoring_list/presentation/pages/clean_tutoring_page.dart';
import 'package:flash_job/feature/presentation/widgets/dialog/confrimation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Create a class to manage services data that updates with language changes
class ServicesDataProvider extends ChangeNotifier {
  // Singleton pattern
  static final ServicesDataProvider _instance = ServicesDataProvider._internal();
  
  factory ServicesDataProvider() {
    return _instance;
  }
  
  ServicesDataProvider._internal();
  
  // Get home services data that's reactive to language changes
  List<Map<String, dynamic>> getHomeServicesData(BuildContext context) {
    // This will be re-evaluated whenever it's called
    return [
      {
        'icon': 'assets/images/homepage/home1.png',
        'title': 'home_services_clean'.tr(),
        'page': CleanServiceListPage(),
        'isJoinOption': false,
      },
      {
        'icon': 'assets/images/homepage/home2.png',
        'title': 'home_services_child'.tr(),
        'page': ChildPage(),
        'isJoinOption': false,
      },
      {
        'icon': 'assets/images/homepage/home3.png',
        'title': 'home_services_tutoring'.tr(),
        'page': CleanTutoringPage(),
        'isJoinOption': false,
      },
      {
        'icon': 'assets/images/homepage/home4.png',
        'title': 'home_services_repair'.tr(),
        'page': RepairPage(),
        'isJoinOption': false,
      },
      {
        'icon': 'assets/images/homepage/home5.png',
        'title': 'home_services_pet'.tr(),
        'page': PetPage(),
        'isJoinOption': false,
      },
      {
        'icon': 'assets/images/homepage/home6.png',
        'title': 'home_services_join'.tr(),
        'action': 'googleform',
        'url': 'https://forms.gle/5c8VVPyAECiCy7GP8', // Replace with your actual Google Form URL
        'isJoinOption': true,
      },
    ];
  }
  
  // Get featured services data that's reactive to language changes
  List<Map<String, dynamic>> getFeaturedServicesData(BuildContext context) {
    // This will be re-evaluated whenever it's called
    return [
      {
        'title': 'featured_services_clean_house_title'.tr(),
        'description': 'featured_services_clean_house_description'.tr(),
        'image': 'assets/images/card_banner2.jpeg',
        'discount': '20%',
        'page': CleanServiceListPage(),
      },
      {
        'title': 'featured_services_english_tutoring_title'.tr(),
        'description': 'featured_services_english_tutoring_description'.tr(),
        'image': 'assets/images/card_banner1.jpeg',
        'discount': '15%',
        'page': CleanTutoringPage(),
      },
      {
        'title': 'featured_services_electrician_title'.tr(),
        'description': 'featured_services_electrician_description'.tr(),
        'image': 'assets/images/card_banner3.jpeg',
        'discount': '10%',
        'page': RepairPage(),
      },
    ];
  }
}
