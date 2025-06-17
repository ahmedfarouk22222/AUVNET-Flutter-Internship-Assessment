
import 'package:ecommerce/core/constans/app_images.dart';
import 'package:flutter/material.dart';

class AuthViewImage extends StatelessWidget {
  const AuthViewImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      height: 336,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.brandImage),
          fit: BoxFit.cover,
        ),
        shape: OvalBorder(),
      ),
    );
  }
}
