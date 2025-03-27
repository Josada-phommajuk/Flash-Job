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

  // Custom input formatter to allow flexible phone number formatting
  TextInputFormatter get phoneInputFormatter => TextInputFormatter.withFunction(
    (oldValue, newValue) {
      // Remove all non-digit characters
      String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
      
      // Limit to 20 digits
      if (digitsOnly.length > 20) {
        digitsOnly = digitsOnly.substring(0, 20);
      }
      
      // Format the phone number with spaces and optional symbols
      String formattedText = _formatPhoneNumber(digitsOnly);
      
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    },
  );

  // Format phone number with spaces and optional symbols
  String _formatPhoneNumber(String digits) {
    if (digits.isEmpty) return '';
    
    // Limit to 20 digits to prevent potential index out of range errors
    digits = digits.length > 20 ? digits.substring(0, 20) : digits;
    
    // Different formatting styles based on length
    if (digits.length <= 3) {
      return digits;
    } else if (digits.length <= 6) {
      return '${digits.substring(0, 3)} ${digits.substring(3)}';
    } else if (digits.length <= 9) {
      return '${digits.substring(0, 3)} ${digits.substring(3, 6)} ${digits.substring(6)}';
    } else if (digits.length <= 12) {
      return '${digits.substring(0, 3)} ${digits.substring(3, 6)} ${digits.substring(6, 9)} ${digits.substring(9)}';
    } else {
      // For longer numbers, split into groups of 3-4 digits
      List<String> groups = [];
      for (int i = 0; i < digits.length; i += 3) {
        int end = i + 3;
        if (end > digits.length) end = digits.length;
        groups.add(digits.substring(i, end));
      }
      return groups.join(' ');
    }
  }

  void _validatePhoneNumber() {
    // Remove all non-digit characters for validation
    String value = phoneController.text.replaceAll(RegExp(r'\D'), '');
    
    isPhoneValid = true;
    errorMessage = null;
    
    if (value.isEmpty) {
      isPhoneValid = false;
      errorMessage = 'pleaseEnterPhoneNumber'.tr();
    } else if (value.length < 8) {
      isPhoneValid = false;
      errorMessage = 'invalidPhoneNumber'.tr();
    }
  }

  Future<void> loadUserData() async {
    var userBox = Hive.box('userBox');

    // Fetch data from Hive Box
    String name = userBox.get('name', defaultValue: '');
    String surname = userBox.get('surname', defaultValue: '');
    String phone = userBox.get('phoneNumber', defaultValue: '');
    String address = userBox.get('address', defaultValue: '');
    String district = userBox.get('district', defaultValue: '');
    String province = userBox.get('province', defaultValue: '');
    String? imagePath = userBox.get('profileImage');

    // Update controller and UI values
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
        
        // Remove non-digit characters when storing phone number
        String phoneNumber = phoneController.text.replaceAll(RegExp(r'\D'), '');
        
        userBox.put('name', nameController.text.trim());
        userBox.put('surname', surnameController.text.trim());
        userBox.put('phoneNumber', phoneNumber);
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