import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;

  const PageIndicator({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5, // Hard-coded number of pages 
        (index) => Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index 
                ? Colors.amber 
                : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}