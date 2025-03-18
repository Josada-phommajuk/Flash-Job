import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../controllers/phone_number_controller.dart';
import '../../services/phone_storage_service.dart';
import '../widgets/phone_number_form.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({Key? key}) : super(key: key);

  @override
  _PhoneNumberPageState createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  late final PhoneNumberController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = PhoneNumberController(
      onPhoneNumberSaved: () => context.go('/address'),
      phoneStorageService: HivePhoneStorageService(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                context.go('/');
              }
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'phoneNumberPageTitle'.tr(),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: PhoneNumberForm(controller: _controller),
        ),
      ),
    );
  }
}