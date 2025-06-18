import 'package:ecommerce/features/home/domain/entities/ad_banner_entity.dart';


abstract class BannerRepository {
  Future<List<BannerEntity>> getBanners();
}
