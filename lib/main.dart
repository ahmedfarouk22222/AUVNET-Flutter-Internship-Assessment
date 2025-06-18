import 'package:ecommerce/features/home/data/models/user_modell_local.dart';
import 'package:ecommerce/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce/core/DependencyInjection/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce/features/home/data/models/service_model.dart';
import 'package:ecommerce/features/home/data/models/restaurant_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(ServiceModelAdapter());
  Hive.registerAdapter(RestaurantModelAdapter());
  await Hive.openBox<ServiceModel>('servicesBox');
  await Hive.openBox<RestaurantModel>('restaurantsBox');
  await Hive.openBox('prefs');
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeBloc>()..add(LoadHomeData()),
      child: MaterialApp(
        home: HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
