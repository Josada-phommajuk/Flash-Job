import 'package:flutter/material.dart';
import 'dart:io';

class ProfileImageWidget extends StatelessWidget {
  final File? profileImage;
  final VoidCallback onTap;

  const ProfileImageWidget({
    Key? key,
    required this.profileImage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.yellow.shade300,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: profileImage != null
                  ? ClipOval(
                      child: Image.file(
                        profileImage!,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(
                      Icons.person_outline,
                      size: 60,
                      color: Colors.black54,
                    ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.yellow,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Icon(
              Icons.camera_alt,
              size: 20,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}