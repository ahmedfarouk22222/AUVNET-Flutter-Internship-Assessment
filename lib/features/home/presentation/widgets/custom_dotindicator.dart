import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage = 0; // الصفحة الحالية
  final int totalPages = 6; // عدد الصفحات الكلي

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == currentPage ? Colors.purple : Colors.grey[300],
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
