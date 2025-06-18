import 'package:ecommerce/features/home/domain/entities/ad_banner_entity.dart';
import 'package:ecommerce/features/home/presentation/widgets/custom_dotindicator.dart';
import 'package:flutter/material.dart';

class ContainerandDotindicatorSection extends StatelessWidget {
  final List<BannerEntity>? banners;
  const ContainerandDotindicatorSection({super.key, this.banners});

  @override
  Widget build(BuildContext context) {
    final imageUrl = (banners != null && banners!.isNotEmpty)
        ? banners!.first.imageUrl
        : "assets/images/container.png";
    return Column(
      children: [
        Container(
          width: 343,
          height: 180,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 10),
        PageIndicator(),
      ],
    );
  }
}
