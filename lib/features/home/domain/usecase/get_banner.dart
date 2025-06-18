import 'package:ecommerce/features/home/domain/entities/ad_banner_entity.dart';
import 'package:ecommerce/features/home/domain/repository/banner_repository.dart';

class GetBanners {
  final BannerRepository repository;

  GetBanners(this.repository);

  Future<List<BannerEntity>> call() async {
    return await repository.getBanners();
  }
}
