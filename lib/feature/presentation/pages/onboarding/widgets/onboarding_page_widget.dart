import 'package:flutter/material.dart';
import '../data/onboardin_data.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingData page;
  final double screenHeight;

  const OnboardingPageWidget({
    Key? key,
    required this.page,
    required this.screenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ปรับขนาดรูปภาพให้เล็กลง
          SizedBox(
            height: screenHeight * 0.3,
            child: Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.01),
              child: Image.asset(
                page.image, 
                fit: BoxFit.contain,
              ),
            ),
          ),
          
          // ลดช่องว่าง
          SizedBox(height: screenHeight * 0.01),
          
          // ปรับแต่งหัวข้อให้ตรงกับภาพ (แบบไม่มีพื้นหลัง)
          Text(
            page.title,
            style: const TextStyle(
              fontSize: 26, 
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: screenHeight * 0.01),
          
          // ปรับคำอธิบายให้มีความกระชับมากขึ้น
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              page.description,
              style: TextStyle(
                fontSize: 16, 
                color: Colors.black54,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}