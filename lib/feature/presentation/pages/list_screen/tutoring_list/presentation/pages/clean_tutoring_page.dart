// lib/pages/clean_tutoring_page.dart
import 'package:flash_job/feature/presentation/pages/list_screen/tutoring_list/presentation/widgets/tutoring_list_Item.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../controllers/tutoring_controller.dart';

class CleanTutoringPage extends StatefulWidget {
  @override
  _CleanTutoringPageState createState() => _CleanTutoringPageState();
}

class _CleanTutoringPageState extends State<CleanTutoringPage> {
  final TutoringController _tutoringController = TutoringController();
  
  @override
  void initState() {
    super.initState();
    _tutoringController.loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('main_title_teach'.tr()),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.purple[50]!],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'main_title_teach'.tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[800],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  TutoringListItem(
                    title: 'language_teacher'.tr(),
                    type: 'language_teacher',
                    iconAsset: 'assets/images/teach1.png',
                    description: 'language_teacher_desc'.tr(),
                    onTap: (type, title) => _tutoringController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  TutoringListItem(
                    title: 'kindergarten_teacher'.tr(),
                    type: 'kindergarten_teacher',
                    iconAsset: 'assets/images/teach2.png',
                    description: 'kindergarten_teacher_desc'.tr(),
                    onTap: (type, title) => _tutoringController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  TutoringListItem(
                    title: 'university_prep'.tr(),
                    type: 'university_prep',
                    iconAsset: 'assets/images/teach3.png',
                    description: 'university_prep_desc'.tr(),
                    onTap: (type, title) => _tutoringController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  TutoringListItem(
                    title: 'it_teacher'.tr(),
                    type: 'it_teacher',
                    iconAsset: 'assets/images/teach4.png',
                    description: 'it_teacher_desc'.tr(),
                    onTap: (type, title) => _tutoringController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  TutoringListItem(
                    title: 'mathematics_teacher'.tr(),
                    type: 'mathematics_teacher',
                    iconAsset: 'assets/images/teach5.png',
                    description: 'mathematics_teacher_desc'.tr(),
                    onTap: (type, title) => _tutoringController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  TutoringListItem(
                    title: 'science_teacher'.tr(),
                    type: 'science_teacher',
                    iconAsset: 'assets/images/teach6.png',
                    description: 'science_teacher_desc'.tr(),
                    onTap: (type, title) => _tutoringController.showConfirmationDialog(context, type, title),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}