import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/home/data/datasources/home_data_source.dart';
import '../models/service_model.dart';
import '../models/banner_model.dart';
import '../models/restaurant_model.dart';
import '../models/shortcut_model.dart';
import '../models/user_modell_local.dart';

class ServiceRemoteDataSourceImpl implements ServiceRemoteDataSource {
  final FirebaseFirestore firestore;

  ServiceRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<ServiceModel>> getServices() async {
    try {
      final snapshot = await firestore.collection('services').get();
      return snapshot.docs
          .map((doc) => ServiceModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch services: $e");
    }
  }
}

class BannerRemoteDataSourceImpl implements BannerRemoteDataSource {
  final FirebaseFirestore firestore;
  BannerRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<BannerModel>> getBanners() async {
    try {
      final snapshot = await firestore.collection('banners').get();
      return snapshot.docs.map((doc) => BannerModel.fromJson(doc.data())).toList();
    } catch (e) {
      throw Exception('Failed to fetch banners: $e');
    }
  }
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  final FirebaseFirestore firestore;
  RestaurantRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<RestaurantModel>> getNearbyRestaurants() async {
    try {
      final snapshot = await firestore.collection('restaurants_nearby').get();
      return snapshot.docs.map((doc) => RestaurantModel.fromJson(doc.data())).toList();
    } catch (e) {
      throw Exception('Failed to fetch restaurants: $e');
    }
  }
}

class ShortcutRemoteDataSourceImpl implements ShortcutRemoteDataSource {
  final FirebaseFirestore firestore;
  ShortcutRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<ShortcutModel>> getShortcuts() async {
    try {
      final snapshot = await firestore.collection('shortcuts').get();
      return snapshot.docs.map((doc) => ShortcutModel.fromJson(doc.data())).toList();
    } catch (e) {
      throw Exception('Failed to fetch shortcuts: $e');
    }
  }
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseFirestore firestore;
  UserRemoteDataSourceImpl(this.firestore);

  @override
  Future<UserModel> getUserData() async {
    try {
      final snapshot = await firestore.collection('users').limit(1).get();
      if (snapshot.docs.isNotEmpty) {
        return UserModel.fromJson(snapshot.docs.first.data());
      } else {
        throw Exception('No user data found');
      }
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }
}
