import 'package:flutter/material.dart';
import '../services/phone_storage_service.dart';

class PhoneNumberController {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Function() onPhoneNumberSaved;
  final PhoneStorageService phoneStorageService;

  bool _isButtonEnabled = false;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  bool get isButtonEnabled => _isButtonEnabled;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Constructor
  PhoneNumberController({
    required this.onPhoneNumberSaved,
    required this.phoneStorageService,
  }) {
    phoneController.addListener(_validatePhoneNumber);
  }

  // Methods
  void _validatePhoneNumber() {
    String value = phoneController.text.trim();
    
    if (value.isEmpty) {
      _isButtonEnabled = false;
      _errorMessage = 'ກະລຸນາໃສ່ເບີໂທລະສັບ';
    } else if (value.length < 8) {
      _isButtonEnabled = false;
      _errorMessage = 'ເບີໂທລະສັບບໍ່ຖືກຕ້ອງ';
    } else {
      _isButtonEnabled = true;
      _errorMessage = null;
    }
    
    notifyListeners();
  }

  void savePhoneNumber() {
    if (formKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();

      // Simulate network delay
      Future.delayed(Duration(milliseconds: 800), () {
        phoneStorageService.savePhoneNumber(phoneController.text.trim());
        
        _isLoading = false;
        notifyListeners();

        onPhoneNumberSaved();
      });
    }
  }

  // For state management
  final List<Function()> _listeners = [];

  void addListener(Function() listener) {
    _listeners.add(listener);
  }

  void removeListener(Function() listener) {
    _listeners.remove(listener);
  }

  void notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

  void dispose() {
    phoneController.dispose();
    _listeners.clear();
  }
}