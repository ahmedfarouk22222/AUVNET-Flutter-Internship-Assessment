import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/home/domain/entities/ad_banner_entity.dart';
import 'package:ecommerce/features/home/domain/entities/restaurant_entity.dart';
import 'package:ecommerce/features/home/domain/entities/service_entity.dart';
import 'package:ecommerce/features/home/domain/entities/shortcut_entity.dart';
import 'package:ecommerce/features/home/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:ecommerce/features/home/domain/usecase/get_banner.dart';
import 'package:ecommerce/features/home/domain/usecase/get_services.dart';
import 'package:ecommerce/features/home/domain/usecase/get_shortcuts.dart';
import 'package:ecommerce/features/home/domain/usecase/get_nearby_restaurants.dart';
import 'package:ecommerce/features/home/domain/usecase/get_user_info.dart';
import 'package:hive/hive.dart';
import 'package:ecommerce/features/home/data/models/service_model.dart';
import 'package:ecommerce/features/home/data/models/restaurant_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBanners getBanners;
  final GetAllServices getAllServices;
  final GetShortcuts getShortcuts;
  final GetNearbyRestaurants getNearbyRestaurants;
  final GetUserInfo getUserInfo;

  HomeBloc({
    required this.getBanners,
    required this.getAllServices,
    required this.getShortcuts,
    required this.getNearbyRestaurants,
    required this.getUserInfo,
  }) : super(HomeInitial()) {
    on<LoadHomeData>((event, emit) async {
      emit(HomeLoading());
      try {
        final banners = await getBanners();
        final services = await getAllServices();
        final shortcuts = await getShortcuts();
        final restaurants = await getNearbyRestaurants();
        final user = await getUserInfo();
        // Cache services and restaurants
        final servicesBox = Hive.box<ServiceModel>('servicesBox');
        await servicesBox.clear();
        await servicesBox.addAll(services.map((e) => ServiceModel(
          title: e.title,
          imageUrl: e.imageUrl,
          subtitle: e.subtitle,
        )));
        final restaurantsBox = Hive.box<RestaurantModel>('restaurantsBox');
        await restaurantsBox.clear();
        await restaurantsBox.addAll(restaurants.map((e) => RestaurantModel(
          name: e.name,
          logoUrl: e.logoUrl,
          deliveryTime: e.deliveryTime,
        )));
        emit(HomeLoaded(
          banners: banners,
          services: services,
          shortcuts: shortcuts,
          restaurants: restaurants,
          user: user,
        ));
      } catch (e) {
        // Try to load from Hive
        final servicesBox = Hive.box<ServiceModel>('servicesBox');
        final restaurantsBox = Hive.box<RestaurantModel>('restaurantsBox');
        final cachedServices = servicesBox.values.toList();
        final cachedRestaurants = restaurantsBox.values.toList();
        if (cachedServices.isNotEmpty && cachedRestaurants.isNotEmpty) {
          emit(HomeLoaded(
            banners: const [], // No banner/shortcut/user cache for now
            services: cachedServices,
            shortcuts: const [],
            restaurants: cachedRestaurants,
            user: const UserEntity(name: '', address: ''),
          ));
        } else {
          emit(HomeError(e.toString()));
        }
      }
    });
  }

  // User Preferences
  Future<void> setPreference(String key, dynamic value) async {
    final prefsBox = Hive.box('prefs');
    await prefsBox.put(key, value);
  }

  dynamic getPreference(String key, {dynamic defaultValue}) {
    final prefsBox = Hive.box('prefs');
    return prefsBox.get(key, defaultValue: defaultValue);
  }
} 