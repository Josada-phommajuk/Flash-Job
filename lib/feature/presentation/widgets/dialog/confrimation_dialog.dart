import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flash_job/core/constants/app_colors.dart';
import 'dart:ui';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmButtonText;
  final String cancelButtonText;
  final VoidCallback onConfirm;
  final String? iconType;

  const ConfirmationDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.onConfirm,
    this.iconType,
  }) : super(key: key);

  static Future<bool> show({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmButtonText,
    String? cancelButtonText,
    required VoidCallback onConfirm,
    String? iconType,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => ConfirmationDialog(
        title: title,
        message: message,
        confirmButtonText: confirmButtonText ?? 'confirm'.tr(),
        cancelButtonText: cancelButtonText ?? 'cancel'.tr(),
        onConfirm: onConfirm,
        iconType: iconType,
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    // กำหนดสีตามประเภท (สำหรับสีของปุ่ม)
    Color accentColor;
    
    switch (iconType) {
      case 'warning':
        accentColor = Color(0xFFFF9800);
        break;
      case 'success':
        accentColor = Color(0xFF4CAF50);
        break;
      case 'info':
        // เปลี่ยนสีเหลืองที่ไม่สวยงาม
        accentColor = Color.fromARGB(255, 255, 174, 0); // เปลี่ยนเป็นสีฟ้า
        break;
      default:
        accentColor = AppColors.primaryGradientStart;
    }

    return AnimatedDialog(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: 320),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ลบแถบสีด้านบนออกและทำส่วนหัวใหม่ที่สวยงามกว่า
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          accentColor.withOpacity(0.05),
                          Colors.white,
                        ],
                      ),
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.85),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                
                // ข้อความ
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.6),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                
                // Divider แบบที่สวยงามกว่า
                Container(
                  height: 1,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.02),
                        Colors.black.withOpacity(0.06),
                        Colors.black.withOpacity(0.02),
                      ],
                    ),
                  ),
                ),
                
                // ปุ่มที่ได้รับการออกแบบใหม่
                Container(
                  padding: EdgeInsets.fromLTRB(24, 16, 24, 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // ปุ่มยกเลิก
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black54,
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          cancelButtonText,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      // ปุ่มยืนยัน
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          onConfirm();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accentColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          confirmButtonText,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Enhanced animation wrapper for dialog
class AnimatedDialog extends StatelessWidget {
  final Widget child;
  
  const AnimatedDialog({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: TweenAnimationBuilder<double>(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOutQuint,
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          return Transform.scale(
            scale: 0.9 + (value * 0.1),
            child: Opacity(
              opacity: value,
              child: child,
            ),
          );
        },
        child: child,
      ),
    );
  }
}