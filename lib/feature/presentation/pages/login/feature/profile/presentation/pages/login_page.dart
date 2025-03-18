import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../services/user_service.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/profile_image_picker.dart';
import '../widgets/save_button.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _userService = UserService();
  File? _profileImage;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  void _setProfileImage(File image) {
    setState(() {
      _profileImage = image;
    });
  }

  void _saveUserData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      _userService.saveUserData(
        name: _nameController.text.trim(),
        surname: _surnameController.text.trim(),
        profileImagePath: _profileImage?.path,
        onComplete: () {
          setState(() {
            _isLoading = false;
          });
          context.go('/phone-number');
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/onboarding');
        return false;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => context.go('/onboarding'),
            ),
            title: Text(
              'PROFILE'.tr(),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                ProfileImagePicker(
                  profileImage: _profileImage,
                  onImageSelected: _setProfileImage,
                ),
                SizedBox(height: 30),
                CustomTextFormField(
                  controller: _nameController,
                  labelText: 'name_profile'.tr(),
                  hintText: 'name_error'.tr(),
                  icon: Icons.person,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'name_error'.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  controller: _surnameController,
                  labelText: 'frist_name'.tr(),
                  hintText: 'frist_error'.tr(),
                  icon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'frist_error'.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                SaveButton(
                  isLoading: _isLoading,
                  onPressed: _saveUserData,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}