import 'package:easy_localization/easy_localization.dart';
import 'package:flash_job/feature/presentation/pages/homescreen/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_ce/hive.dart';
import 'dart:io';

class EditProfileController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final districtController = TextEditingController();
  final provinceController = TextEditingController();
  
  File? profileImage;
  String? profileImagePath;
  bool isLoading = false;
  bool isPhoneValid = true;
  String? errorMessage;

  void init() {
    phoneController.addListener(_validatePhoneNumber);
    loadUserData();
  }

  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    districtController.dispose();
    provinceController.dispose();
  }

  void _validatePhoneNumber() {
    String value = phoneController.text.trim();
    isPhoneValid = true;
    errorMessage = null;
    
    if (value.isEmpty) {
      isPhoneValid = false;
      errorMessage = 'pleaseEnterPhoneNumber'.tr();
    } else if (value.length < 8) {
      isPhoneValid = false;
      errorMessage = 'invalidPhoneNumbe'.tr();
    }
  }

  Future<void> loadUserData() async {
    var userBox = Hive.box('userBox');

    // ดึงข้อมูลจาก Hive Box
    String name = userBox.get('name', defaultValue: '');
    String surname = userBox.get('surname', defaultValue: '');
    String phone = userBox.get('phoneNumber', defaultValue: '');
    String address = userBox.get('address', defaultValue: '');
    String district = userBox.get('district', defaultValue: '');
    String province = userBox.get('province', defaultValue: '');
    String? imagePath = userBox.get('profileImage');

    // อัพเดตค่าใน controller และ UI
    nameController.text = name;
    surnameController.text = surname;
    phoneController.text = phone;
    addressController.text = address;
    districtController.text = district;
    provinceController.text = province;

    if (imagePath != null && imagePath.isNotEmpty) {
      profileImagePath = imagePath;
      profileImage = File(imagePath);
    }
  }

  void updateUserData(BuildContext context) {
    if (formKey.currentState!.validate()) {
      isLoading = true;

      // Simulate network delay
      Future.delayed(Duration(milliseconds: 800), () {
        var userBox = Hive.box('userBox');
        userBox.put('name', nameController.text.trim());
        userBox.put('surname', surnameController.text.trim());
        userBox.put('phoneNumber', phoneController.text.trim());
        userBox.put('address', addressController.text.trim());
        userBox.put('district', districtController.text.trim());
        userBox.put('province', provinceController.text.trim());

        if (profileImage != null) {
          userBox.put('profileImage', profileImage!.path);
        }

        isLoading = false;

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('ຂໍ້ມູນຖືກບັນທຶກສຳເລັດແລ້ວ'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );

        // Navigate to homepage instead of popping back
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    }
  }
}