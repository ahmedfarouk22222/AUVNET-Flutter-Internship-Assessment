
import 'package:ecommerce/core/routes/router.dart';
import 'package:ecommerce/features/onboarding/presentation/data/onboarding_model.dart';
import 'package:ecommerce/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:ecommerce/features/onboarding/presentation/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> onboardingData = [
    OnboardingModel(
      title: "all-in-one delivery",
      subtitle:
          "Order groceries, medicines, and meals delivered straight to your door",
    ),
    OnboardingModel(
      title: "User-to-User Delivery",
      subtitle: "Send or receive items from other users quickly and easily",
    ),
    OnboardingModel(
      title: "Sales & Discounts",
      subtitle: "Discover exclusive sales and deals every day",
    ),
  ];

  void _goNext() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      GoRouter.of(context).push(AppRouter.kLoginView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingData.length,
        onPageChanged: (index) => setState(() => _currentPage = index),
        itemBuilder: (context, index) {
          final model = onboardingData[index];

          return Column(
            spacing: 50,
            children: [
              SizedBox(
                height: 400,
                child: Stack(children: const [OnboardingImage()]),
              ),

              const SizedBox(height: 32),

              // المحتوى اللي تحت
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: OnboardingContent(
                  title: model.title,
                  subtitle: model.subtitle,
                  isLastPage: index == onboardingData.length - 1,
                  onNext: _goNext,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
