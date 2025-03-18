import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/service_list_item.dart';
import '../controllers/service_controller.dart';

class CleanServiceListPage extends StatefulWidget {
  @override
  _CleanServiceListPageState createState() => _CleanServiceListPageState();
}

class _CleanServiceListPageState extends State<CleanServiceListPage> {
  final ServiceController _serviceController = ServiceController();
  
  @override
  void initState() {
    super.initState();
    _serviceController.loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pageTitle'.tr()),
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
            colors: [Colors.white, Colors.blue[50]!],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'pageTitle'.tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  ServiceListItem(
                    title: 'houseCleaningTitle'.tr(),
                    type: 'houseCleaningTitle',
                    iconAsset: 'assets/icons/w.png',
                    description: 'houseCleaningDescription'.tr(),
                    onTap: (type, title) => _serviceController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  ServiceListItem(
                    title: 'gardenCleaningTitle'.tr(),
                    type: 'gardenCleaningTitle',
                    iconAsset: 'assets/icons/man.png',
                    description: 'gardenCleaningDescription'.tr(),
                    onTap: (type, title) => _serviceController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  ServiceListItem(
                    title: 'laundryTitle'.tr(),
                    type: 'laundryTitle',
                    iconAsset: 'assets/icons/woman.png',
                    description: 'laundryDescription'.tr(),
                    onTap: (type, title) => _serviceController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  ServiceListItem(
                    title: 'airConditionerTitle'.tr(),
                    type: 'airConditionerTitle',
                    iconAsset: 'assets/icons/air.png',
                    description: 'airConditionerDescription'.tr(),
                    onTap: (type, title) => _serviceController.showConfirmationDialog(context, type, title),
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