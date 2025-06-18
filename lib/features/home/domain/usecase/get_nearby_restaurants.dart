import 'package:ecommerce/features/home/domain/repository/restaurant_repository.dart';

import '../entities/restaurant_entity.dart';

class GetNearbyRestaurants {
  final RestaurantRepository repository;

  GetNearbyRestaurants(this.repository);

  Future<List<RestaurantEntity>> call() async {
    return await repository.getNearbyRestaurants();
  }
}
