import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'custom_text_field.dart';
import 'save_button.dart';

class AddressForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController addressController;
  final TextEditingController districtController;
  final TextEditingController provinceController;
  final bool isLoading;
  final VoidCallback onSave;

  const AddressForm({
    Key? key,
    required this.formKey,
    required this.addressController,
    required this.districtController,
    required this.provinceController,
    required this.isLoading,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Icon(
                Icons.location_on,
                size: 80,
                color: Colors.yellow.shade600,
              ),
              SizedBox(height: 30),
              CustomTextField(
                controller: addressController,
                labelText: 'villageLabel'.tr(),
                hintText: 'villageHint'.tr(),
                icon: Icons.home,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'villageRequired'.tr();
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: districtController,
                labelText: 'districtLabel'.tr(),
                hintText: 'districtHint'.tr(),
                icon: Icons.location_city,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'districtRequired'.tr();
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: provinceController,
                labelText: 'provinceLabel'.tr(),
                hintText: 'provinceHint'.tr(),
                icon: Icons.map,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'provinceRequired'.tr();
                  }
                  return null;
                },
              ),
              SizedBox(height: 50),
              SaveButton(
                isLoading: isLoading,
                onPressed: onSave,
                buttonText: 'saveButton'.tr(),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}