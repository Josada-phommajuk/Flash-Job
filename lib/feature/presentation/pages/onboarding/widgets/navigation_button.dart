import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class NavigationButton extends StatelessWidget {
  final int currentPage;
  final PageController pageController;
  final VoidCallback onLastPage;

  const NavigationButton({
    Key? key,
    required this.currentPage,
    required this.pageController,
    required this.onLastPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (currentPage == 4) {
              onLastPage();
            } else {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
          child: Text(
            'continue'.tr(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}