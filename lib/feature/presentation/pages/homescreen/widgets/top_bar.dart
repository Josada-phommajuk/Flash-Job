import 'package:flash_job/feature/presentation/pages/homescreen/widgets/url_service.dart';
import 'package:flash_job/feature/presentation/widgets/language/language_selector_dialog.dart';
import 'package:flutter/material.dart';

import '../../update_form/presentation/pages/edit_profile_page.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/icons/logo.png', width: 120),
                ],
              ),
            ],
          ),
          // Fixed: Remove Flexible and use Row with MainAxisSize.min
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIconButton(context, Icons.phone, 0),
              SizedBox(width: 8),
              _buildIconButton(context, Icons.language, 1),
              SizedBox(width: 8),
              _buildIconButton(context, Icons.person, 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        // Navigate to different pages based on index
        switch (index) {
          case 0:
            // Phone icon - Launch WhatsApp with specified phone number
            UrlService.launchWhatsApp();
            break;
          case 1:
            // Language icon - Show language dialog directly on this page
            _showLanguageDialog(context);
            break;
          case 2:
            // Person icon - Navigate to Profile
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfilePage()),
            );
            break;
        }
      },
      child: Icon(icon, size: 24, color: Colors.black),
    );
  }
  
  // New method to show the language dialog
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LanguageSelectorDialog();
      },
    );
  }
}