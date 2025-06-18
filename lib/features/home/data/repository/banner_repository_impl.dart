import 'package:ecommerce/features/home/data/datasources/home_data_source.dart';
import 'package:ecommerce/features/home/data/models/banner_model.dart';
import 'package:ecommerce/features/home/domain/entities/ad_banner_entity.dart';
import 'package:ecommerce/features/home/domain/repository/banner_repository.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerRemoteDataSource remoteDataSource;

  BannerRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<BannerEntity>> getBanners() async {
    final List<BannerModel> data = await remoteDataSource.getBanners();
    return data;
  }
}
