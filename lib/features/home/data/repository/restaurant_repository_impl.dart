import 'package:ecommerce/features/home/data/datasources/home_data_source.dart';

import 'package:ecommerce/features/home/data/models/restaurant_model.dart';
import 'package:ecommerce/features/home/domain/entities/restaurant_entity.dart';
import 'package:ecommerce/features/home/domain/repository/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantRemoteDataSource remoteDataSource;

  RestaurantRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<RestaurantEntity>> getNearbyRestaurants() async {
    final List<RestaurantModel> data = await remoteDataSource
        .getNearbyRestaurants();
    return data;
  }
}
