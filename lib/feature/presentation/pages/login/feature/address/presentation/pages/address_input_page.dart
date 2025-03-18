import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce/hive.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../services/address_service.dart';
import '../widgets/address_form.dart';

class AddressInputPage extends StatefulWidget {
  @override
  _AddressInputPageState createState() => _AddressInputPageState();
}

class _AddressInputPageState extends State<AddressInputPage> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _districtController = TextEditingController();
  final _provinceController = TextEditingController();
  bool _isLoading = false;
  final _addressService = AddressService();

  @override
  void dispose() {
    _addressController.dispose();
    _districtController.dispose();
    _provinceController.dispose();
    super.dispose();
  }

  void _saveAddressData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      _addressService.saveAddress(
        address: _addressController.text.trim(),
        district: _districtController.text.trim(),
        province: _provinceController.text.trim(),
        onComplete: () {
          setState(() {
            _isLoading = false;
          });
          context.go('/home');
        },
      );
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
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'addressInputPageTitle'.tr(),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: AddressForm(
            formKey: _formKey,
            addressController: _addressController,
            districtController: _districtController,
            provinceController: _provinceController,
            isLoading: _isLoading,
            onSave: _saveAddressData,
          ),
        ),
      ),
    );
  }
}