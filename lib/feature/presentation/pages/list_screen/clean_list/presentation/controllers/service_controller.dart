import 'package:flash_job/feature/presentation/pages/list_screen/clean_list/data/repositories/user_repository.dart';
import 'package:flash_job/feature/presentation/pages/list_screen/clean_list/dialogs/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ServiceController {
  final UserRepository _userRepository = UserRepository();
  
  String? name;
  String? surname;
  String? phoneNumber;
  String? profileImage;
  String? address;
  String? district;
  String? province;

  // Load user data from repository
  void loadUserData() {
    final userData = _userRepository.getUserData();
    name = userData.name;
    surname = userData.surname;
    phoneNumber = userData.phoneNumber;
    profileImage = userData.profileImage;
    address = userData.address;
    district = userData.district;
    province = userData.province;
  }

  // Show confirmation dialog
  void showConfirmationDialog(BuildContext context, String serviceType, String serviceTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          serviceTitle: serviceTitle,
          onConfirm: () {
            Navigator.of(context).pop();
            launchWhatsApp(context, serviceType);
          },
        );
      },
    );
  }

  // Launch WhatsApp with prepared message
  void launchWhatsApp(BuildContext context, String serviceType) async {
    String message = prepareMessage(serviceType);

    final link = WhatsAppUnilink(
      phoneNumber: '+8562096794376', // Your phone number
      text: message,
    );

    try {
      await launch('$link');
    } catch (e) {
      print('Could not launch WhatsApp: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('ບໍ່ສາມາດເປີດ WhatsApp ໄດ້'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  // Prepare message based on selected type
  String prepareMessage(String serviceType) {
    // Create full address string
    String fullAddress = "$address, $district, $province";
    
    // Return formatted message
    return '''ສະບາຍດີ
ສົນໃຈບໍລິການທຳຄວາມສະອາດ
ຊື່: $name $surname 
ເບີໂທ: $phoneNumber
ທີ່ຢູ່: $fullAddress''';
  }
}