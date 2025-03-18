// lib/pages/repair_page.dart
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/repair_service_item.dart';
import '../controllers/repair_controller.dart';

class RepairPage extends StatefulWidget {
  @override
  _RepairPageState createState() => _RepairPageState();
}

class _RepairPageState extends State<RepairPage> {
  final RepairController _repairController = RepairController();
  
  @override
  void initState() {
    super.initState();
    _repairController.loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('repair_service_title'.tr()),
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
            colors: [Colors.white, Colors.orange[50]!],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'repair_services'.tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  RepairServiceItem(
                    title: 'electrician'.tr(),
                    type: 'electrician',
                    iconAsset: 'assets/images/charg1.png',
                    description: 'electrician_desc'.tr(),
                    onTap: (type, title) => _repairController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  RepairServiceItem(
                    title: 'aircon'.tr(),
                    type: 'aircon',
                    iconAsset: 'assets/images/charg2.png',
                    description: 'aircon_desc'.tr(),
                    onTap: (type, title) => _repairController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  RepairServiceItem(
                    title: 'mechanic'.tr(),
                    type: 'mechanic',
                    iconAsset: 'assets/images/charg1.png',
                    description: 'mechanic_desc'.tr(),
                    onTap: (type, title) => _repairController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  RepairServiceItem(
                    title: 'construction'.tr(),
                    type: 'construction',
                    iconAsset: 'assets/images/charg4.png',
                    description: 'construction_desc'.tr(),
                    onTap: (type, title) => _repairController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  RepairServiceItem(
                    title: 'welder'.tr(),
                    type: 'welder',
                    iconAsset: 'assets/images/charg5.png',
                    description: 'welder_desc'.tr(),
                    onTap: (type, title) => _repairController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  RepairServiceItem(
                    title: 'carpenter'.tr(),
                    type: 'carpenter',
                    iconAsset: 'assets/images/charg6.png',
                    description: 'carpenter_desc'.tr(),
                    onTap: (type, title) => _repairController.showConfirmationDialog(context, type, title),
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