import '../entities/restaurant_entity.dart';

abstract class RestaurantRepository {
  Future<List<RestaurantEntity>> getNearbyRestaurants();
}
