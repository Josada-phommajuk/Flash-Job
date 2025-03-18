import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Colors.yellow;
  static final Color primaryLightColor = Colors.yellow.shade300;
  static const Color textColorPrimary = Colors.black;
  static const Color textColorSecondary = Colors.black87;
  static const Color textColorGrey = Colors.grey;
  static const Color errorColor = Colors.red;
  static const Color backgroundColor = Colors.white;
  
  // Text Styles
  static const TextStyle titleStyle = TextStyle(
    color: textColorPrimary,
    fontWeight: FontWeight.bold,
  );
  
  static const TextStyle buttonTextStyle = TextStyle(
    color: textColorPrimary,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  
  // Input Decoration
  static InputDecoration inputDecoration({
    required String labelText,
    required String hintText,
    required IconData prefixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      labelStyle: TextStyle(color: textColorGrey),
      prefixIcon: Icon(prefixIcon, color: textColorGrey),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: textColorGrey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
          width: 2,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: errorColor),
      ),
    );
  }
  
  // Button Style
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: textColorPrimary,
    padding: EdgeInsets.symmetric(vertical: 15),
    elevation: 5,
    shadowColor: Colors.black38,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
}