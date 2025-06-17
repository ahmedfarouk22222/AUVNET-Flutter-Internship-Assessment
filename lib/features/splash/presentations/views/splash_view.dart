import 'dart:async';


import 'package:ecommerce/core/constans/app_colors.dart';
import 'package:ecommerce/core/constans/app_images.dart';
import 'package:ecommerce/core/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splashview extends StatefulWidget {
  const Splashview({super.key});

  @override
  State<Splashview> createState() => _SplashviewState();
}

class _SplashviewState extends State<Splashview> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRouter.kOnBoardingView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: Image.asset(AppImages.brandImage)),
    );
  }
}
