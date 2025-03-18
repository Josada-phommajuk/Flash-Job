// lib/pages/pet_page.dart
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/pet_service_item.dart';
import '../controllers/pet_controller.dart';

class PetPage extends StatefulWidget {
  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  final PetController _petController = PetController();
  
  @override
  void initState() {
    super.initState();
    _petController.loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pet_care_service'.tr()),
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
            colors: [Colors.white, Colors.green[50]!],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'pet'.tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  PetServiceItem(
                    title: 'dog_walking'.tr(),
                    type: 'dogWalking',
                    iconAsset: 'assets/icons/dog.png',
                    description: 'dog_walking_desc'.tr(),
                    onTap: (type, title) => _petController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  PetServiceItem(
                    title: 'pet_sitting'.tr(),
                    type: 'petSitting',
                    iconAsset: 'assets/icons/pet.png',
                    description: 'pet_sitting_desc'.tr(),
                    onTap: (type, title) => _petController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  PetServiceItem(
                    title: 'pet_grooming'.tr(),
                    type: 'petGrooming',
                    iconAsset: 'assets/icons/grooming.png',
                    description: 'pet_grooming_desc'.tr(),
                    onTap: (type, title) => _petController.showConfirmationDialog(context, type, title),
                  ),
                  SizedBox(height: 16),
                  PetServiceItem(
                    title: 'pet_boarding'.tr(),
                    type: 'petBoarding',
                    iconAsset: 'assets/icons/boarding.png',
                    description: 'pet_boarding_desc'.tr(),
                    onTap: (type, title) => _petController.showConfirmationDialog(context, type, title),
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