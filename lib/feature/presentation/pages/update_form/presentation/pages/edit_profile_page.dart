import 'package:easy_localization/easy_localization.dart';
import 'package:flash_job/feature/presentation/pages/homescreen/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../controller/edit_profile_controller.dart';
import '../widgets/profile_form_fields.dart';
import '../widgets/profile_image_widget.dart';
import '../widgets/profile_save_button.dart';
import 'package:permission_handler/permission_handler.dart'; // เพิ่มบรรทัดนี้

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late EditProfileController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EditProfileController();
    _controller.init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    // ตรวจสอบและขออนุญาตก่อน
    bool canProceed = true;
    
    if (Platform.isAndroid) {
      PermissionStatus status;
      
      // ตรวจสอบเวอร์ชัน Android
      if (int.parse(Platform.version.split('.').first) >= 13) {
        // Android 13 หรือสูงกว่า ใช้ READ_MEDIA_IMAGES
        status = await Permission.photos.request();
      } else {
        // Android 12 หรือต่ำกว่า ใช้ READ_EXTERNAL_STORAGE
        status = await Permission.storage.request();
      }
      
      if (!status.isGranted) {
        canProceed = false;
        // แสดงข้อความแจ้งผู้ใช้
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('จำเป็นต้องได้รับอนุญาตเพื่อเลือกรูปภาพ')),
        );
      }
    }
    
    if (canProceed) {
      try {
        final pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 80,
        );
        if (pickedFile != null) {
          setState(() {
            _controller.profileImage = File(pickedFile.path);
          });
        }
      } catch (e) {
        print('เกิดข้อผิดพลาดในการเลือกรูปภาพ: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ไม่สามารถเข้าถึงรูปภาพได้: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'edit_profile'.tr(),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Form(
            key: _controller.formKey,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    ProfileImageWidget(
                      profileImage: _controller.profileImage,
                      onTap: _pickImage,
                    ),
                    SizedBox(height: 30),
                    ProfileFormFields(controller: _controller),
                    SizedBox(height: 50),
                    ProfileSaveButton(
                      isLoading: _controller.isLoading,
                      onPressed: () => _controller.updateUserData(context),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}