part of 'home_bloc.dart';


abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<BannerEntity> banners;
  final List<ServiceEntity> services;
  final List<ShortcutEntity> shortcuts;
  final List<RestaurantEntity> restaurants;
  final UserEntity user;

  const HomeLoaded({
    required this.banners,
    required this.services,
    required this.shortcuts,
    required this.restaurants,
    required this.user,
  });

  @override
  List<Object?> get props => [banners, services, shortcuts, restaurants, user];

  HomeLoaded copyWith({
    List<BannerEntity>? banners,
    List<ServiceEntity>? services,
    List<ShortcutEntity>? shortcuts,
    List<RestaurantEntity>? restaurants,
    UserEntity? user,
  }) {
    return HomeLoaded(
      banners: banners ?? this.banners,
      services: services ?? this.services,
      shortcuts: shortcuts ?? this.shortcuts,
      restaurants: restaurants ?? this.restaurants,
      user: user ?? this.user,
    );
  }
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
} 