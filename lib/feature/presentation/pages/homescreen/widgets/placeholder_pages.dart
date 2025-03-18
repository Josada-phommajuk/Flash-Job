

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Placeholder classes for navigation
class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('contact'.tr())),
      body: Center(child: Text('contact_page'.tr())),
    );
  }
}

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('language'.tr())),
      body: Center(child: Text('language_settings'.tr())),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('profile'.tr())),
      body: Center(child: Text('profile_page'.tr())),
    );
  }
}