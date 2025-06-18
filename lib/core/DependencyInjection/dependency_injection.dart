import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/auth/data/datasources/firebase_auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce/features/auth/domain/usecases/login_user.dart';
import 'package:ecommerce/features/auth/domain/usecases/register_user.dart';
import 'package:ecommerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce/features/home/data/datasources/home_data_source.dart';
import 'package:ecommerce/features/home/data/datasources/home_data_source_imp.dart';
import 'package:ecommerce/features/home/data/repository/banner_repository_impl.dart';
import 'package:ecommerce/features/home/data/repository/restaurant_repository_impl.dart';
import 'package:ecommerce/features/home/data/repository/service_repository_impl.dart';
import 'package:ecommerce/features/home/data/repository/shortcut_repository_impl.dart';
import 'package:ecommerce/features/home/data/repository/user_repository_impl.dart';
import 'package:ecommerce/features/home/domain/repository/banner_repository.dart';
import 'package:ecommerce/features/home/domain/repository/restaurant_repository.dart';
import 'package:ecommerce/features/home/domain/repository/service_repository.dart';
import 'package:ecommerce/features/home/domain/repository/shortcut_repository.dart';
import 'package:ecommerce/features/home/domain/repository/user_repository.dart';
import 'package:ecommerce/features/home/domain/usecase/get_banner.dart';
import 'package:ecommerce/features/home/domain/usecase/get_nearby_restaurants.dart';
import 'package:ecommerce/features/home/domain/usecase/get_services.dart';
import 'package:ecommerce/features/home/domain/usecase/get_shortcuts.dart';
import 'package:ecommerce/features/home/domain/usecase/get_user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void setupLocator() {
  print("Registering FirebaseAuth");
  getIt.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);

  print("Registering FirebaseAuthRemoteDataSource");
  getIt.registerFactory<FirebaseAuthRemoteDataSource>(
    () => FirebaseAuthRemoteDataSourceImpl(firebaseAuth: getIt()),
  );

  print("Registering AuthRepository");
  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(getIt(), authRemoteDataSource: getIt()),
  );

  print("Registering UseCases");
  getIt.registerFactory<LoginUser>(() => LoginUser(getIt()));
  getIt.registerFactory<RegisterUser>(() => RegisterUser(getIt()));

  print("Registering AuthBloc");
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(loginUser: getIt(), registerUser: getIt()),
  );
  getIt.registerLazySingleton<ServiceRemoteDataSource>(
    () => ServiceRemoteDataSourceImpl(FirebaseFirestore.instance),
  );

  // Home Feature DI
  getIt.registerLazySingleton<BannerRemoteDataSource>(() => BannerRemoteDataSourceImpl(FirebaseFirestore.instance));
  getIt.registerLazySingleton<BannerRepository>(() => BannerRepositoryImpl(getIt()));
  getIt.registerLazySingleton<GetBanners>(() => GetBanners(getIt()));

  getIt.registerLazySingleton<ServiceRemoteDataSource>(() => ServiceRemoteDataSourceImpl(FirebaseFirestore.instance));
  getIt.registerLazySingleton<ServiceRepository>(() => ServiceRepositoryImpl(getIt()));
  getIt.registerLazySingleton<GetAllServices>(() => GetAllServices(getIt()));

  getIt.registerLazySingleton<ShortcutRemoteDataSource>(() => ShortcutRemoteDataSourceImpl(FirebaseFirestore.instance));
  getIt.registerLazySingleton<ShortcutRepository>(() => ShortcutRepositoryImpl(getIt()));
  getIt.registerLazySingleton<GetShortcuts>(() => GetShortcuts(getIt()));

  getIt.registerLazySingleton<RestaurantRemoteDataSource>(() => RestaurantRemoteDataSourceImpl(FirebaseFirestore.instance));
  getIt.registerLazySingleton<RestaurantRepository>(() => RestaurantRepositoryImpl(getIt()));
  getIt.registerLazySingleton<GetNearbyRestaurants>(() => GetNearbyRestaurants(getIt()));

  getIt.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(FirebaseFirestore.instance));
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(remoteDataSource: getIt()));
  getIt.registerLazySingleton<GetUserInfo>(() => GetUserInfo(getIt()));
}
