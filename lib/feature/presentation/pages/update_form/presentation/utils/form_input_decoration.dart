import 'package:flutter/material.dart';

class FormInputDecoration {
  static InputDecoration buildInputDecoration({
    required String labelText,
    required String hintText,
    required Icon prefixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      labelStyle: TextStyle(color: Colors.grey),
      prefixIcon: prefixIcon,
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
    );
  }
}