// lib/pages/child_page.dart
import 'package:flash_job/feature/presentation/pages/list_screen/child_list/widgets/child_service_item.dart';
import 'package:flash_job/feature/presentation/pages/list_screen/child_list/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../controllers/child_controller.dart';

class ChildPage extends StatefulWidget {
  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  final ChildController _childController = ChildController();

  @override
  void initState() {
    super.initState();
    _childController.loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pageTitlech'.tr()),
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
            colors: [Colors.white, Colors.pink[50]!],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'pageTitlech'.tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[600],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  ChildServiceItem(
                    title: 'serviceTitle'.tr(),
                    type: 'serviceTitle',
                    iconAsset: 'assets/icons/child.png',
                    description: 'childServiceDescription'.tr(),
                    onTap: (type, title) => _childController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  InfoCard(
                    title: 'aboutOurServiceTitle'.tr(),
                    content: 'aboutOurServiceContent'.tr(),
                    icon: Icons.info_outline,
                  ),
                  SizedBox(height: 16),
                  InfoCard(
                    title: 'ourServicesTitle'.tr(),
                    content: 'ourServicesContent'.tr(),
                    icon: Icons.star_outline,
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