import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isLastPage;
  final VoidCallback onNext;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isLastPage,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // العنوان الرئيسي
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            fontFamily: 'Rubik',
            letterSpacing: -0.3,
            color: Color(0xFF333333),
          ),
        ),

        const SizedBox(height: 16),

        // الوصف
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Rubik',
              height: 1.66,
              letterSpacing: -0.3,
              color: Color(0xE5677294),
            ),
          ),
        ),

        const SizedBox(height: 90),

        // الزر البنفسجي
        GestureDetector(
          onTap: onNext,
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF8900FE),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              'Get Started',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Rubik',
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        
        const Text(
          'Next',
          style: TextStyle(
            color: Color(0xFF677294),
            fontSize: 14,
            fontFamily: 'Rubik',
            height: 1.66,
            letterSpacing: -0.30,
          ),
        ),
      ],
    );
  }
}
