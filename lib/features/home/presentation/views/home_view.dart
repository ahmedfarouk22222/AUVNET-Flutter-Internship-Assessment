import 'package:ecommerce/features/home/presentation/widgets/container_and_dotindicator_section.dart';
import 'package:ecommerce/features/home/presentation/widgets/custom_bottom_nav.dart';
import 'package:ecommerce/features/home/presentation/widgets/home_header.dart';
import 'package:ecommerce/features/home/presentation/widgets/order_card.dart';
import 'package:ecommerce/features/home/presentation/widgets/popular_restaurants_nearby_section.dart';
import 'package:ecommerce/features/home/presentation/widgets/service_section.dart';
import 'package:ecommerce/features/home/presentation/widgets/service_section_text.dart';
import 'package:ecommerce/features/home/presentation/widgets/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/home/presentation/bloc/home_bloc.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeError) {
              return Center(child: Text('Error: \\${state.message}'));
            } else if (state is HomeLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeader(),
                    SizedBox(height: 15),
                    ServiceSectionText(),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 130,
                      width: double.infinity,
                      child: ServiceListView(services: state.services),
                    ),
                    SizedBox(height: 15),
                    OrderCard(),
                    SizedBox(height: 15),
                    ShortcutsSection(shortcuts: state.shortcuts),
                    SizedBox(height: 15),
                    ContainerandDotindicatorSection(banners: state.banners),
                    SizedBox(height: 15),
                    PopularrestaurantsnearbySection(restaurants: state.restaurants),
                    SizedBox(height: 30),
                    CustomBottomNav(),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
