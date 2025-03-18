import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../controllers/phone_number_controller.dart';

class PhoneNumberForm extends StatefulWidget {
  final PhoneNumberController controller;

  const PhoneNumberForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _PhoneNumberFormState createState() => _PhoneNumberFormState();
}

class _PhoneNumberFormState extends State<PhoneNumberForm> {
  late PhoneNumberController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller.addListener(_handleControllerUpdate);
  }

  void _handleControllerUpdate() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller.formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24),
              Text(
                'pleaseEnterYourPhoneNumber'.tr(),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'phoneNumberWillBeStoredPrivately'.tr(),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              _buildPhoneNumberField(),
              SizedBox(height: 16),
              _buildVerificationText(),
              SizedBox(height: 120),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      controller: _controller.phoneController,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      decoration: InputDecoration(
        hintText: 'phoneNumberHint'.tr(),
        errorText: _controller.errorMessage,
        prefixText: '+856 ',
        prefixIcon: Icon(Icons.phone, color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.yellow.shade700, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
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

  Widget _buildVerificationText() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'verifyYourPhoneNumber'.tr(),
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 12,
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 56,
      margin: EdgeInsets.only(bottom: 20),
      child: _controller.isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow.shade700),
              ),
            )
          : ElevatedButton(
              onPressed: _controller.isButtonEnabled ? _controller.savePhoneNumber : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _controller.isButtonEnabled 
                    ? Colors.yellow.shade700 
                    : Colors.grey[300],
                foregroundColor: Colors.black,
                elevation: 5,
                shadowColor: Colors.black26,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'confirm'.tr(),
                style: TextStyle(
                  color: _controller.isButtonEnabled 
                      ? Colors.black 
                      : Colors.grey[500],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}