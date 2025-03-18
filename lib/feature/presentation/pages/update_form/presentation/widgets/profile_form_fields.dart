import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../controller/edit_profile_controller.dart';

class ProfileFormFields extends StatelessWidget {
  final EditProfileController controller;

  const ProfileFormFields({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller.nameController,
          decoration: InputDecoration(
            labelText: 'name_profile'.tr(),
            hintText: 'name_error'.tr(),
            labelStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.person, color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.yellow,
                width: 2,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'name_error'.tr();
            }
            return null;
          },
        ),
        SizedBox(height: 16),
        TextFormField(
          controller: controller.surnameController,
          decoration: InputDecoration(
            labelText: 'frist_name'.tr(),
            hintText: 'frist_error'.tr(),
            labelStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.yellow,
                width: 2,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'frist_error'.tr();
            }
            return null;
          },
        ),
        SizedBox(height: 16),
        _buildPhoneField(),
        SizedBox(height: 16),
        _buildAddressField(),
        SizedBox(height: 16),
        _buildDistrictField(),
        SizedBox(height: 16),
        _buildProvinceField(),
      ],
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      controller: controller.phoneController,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      decoration: InputDecoration(
        labelText: 'phoneNumberPageTitle'.tr(),
        hintText: 'phoneNumberHin'.tr(),
        errorText: controller.errorMessage,
        prefixText: '+856 ',
        prefixIcon: Icon(Icons.phone, color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellow,
            width: 2,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'pleaseEnterPhoneNumber'.tr();
        }
        if (value.trim().length < 8) {
          return 'invalidPhoneNumber'.tr();
        }
        return null;
      },
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      controller: controller.addressController,
      decoration: InputDecoration(
        labelText: 'villageLabel'.tr(),
        hintText: 'villageHint'.tr(),
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.home, color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellow,
            width: 2,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'villageHint'.tr();
        }
        return null;
      },
    );
  }

  Widget _buildDistrictField() {
    return TextFormField(
      controller: controller.districtController,
      decoration: InputDecoration(
        labelText: 'districtLabel'.tr(),
        hintText: 'districtHint'.tr(),
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.location_city, color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellow,
            width: 2,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'districtHint'.tr();
        }
        return null;
      },
    );
  }

  Widget _buildProvinceField() {
    return TextFormField(
      controller: controller.provinceController,
      decoration: InputDecoration(
        labelText: 'provinceLabel'.tr(),
        hintText: 'provinceHint'.tr(),
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.map, color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellow,
            width: 2,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'provinceHint'.tr();
        }
        return null;
      },
    );
  }
}