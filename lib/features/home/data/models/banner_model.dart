import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/home/domain/entities/ad_banner_entity.dart';


class BannerModel extends BannerEntity {
  const BannerModel({required super.redirectUrl, required super.imageUrl});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      redirectUrl: json['id'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'image_url': imageUrl,
      };
}
