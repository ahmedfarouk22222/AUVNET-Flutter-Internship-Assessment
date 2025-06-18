import 'package:ecommerce/features/home/data/models/banner_model.dart';
import 'package:ecommerce/features/home/data/models/restaurant_model.dart';
import 'package:ecommerce/features/home/data/models/service_model.dart';
import 'package:ecommerce/features/home/data/models/shortcut_model.dart';
import 'package:ecommerce/features/home/data/models/user_modell_local.dart';



abstract class BannerRemoteDataSource {
  Future<List<BannerModel>> getBanners();
}


abstract class RestaurantRemoteDataSource {
  Future<List<RestaurantModel>> getNearbyRestaurants();
}

abstract class ServiceRemoteDataSource {
  Future<List<ServiceModel>> getServices();
}

abstract class ShortcutRemoteDataSource {
  Future<List<ShortcutModel>> getShortcuts();
}




abstract class UserRemoteDataSource {
  Future<UserModel> getUserData();
}
