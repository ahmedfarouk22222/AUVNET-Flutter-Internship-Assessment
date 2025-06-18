import 'package:flutter/material.dart';
import 'package:ecommerce/features/home/domain/entities/restaurant_entity.dart';

class PopularrestaurantsnearbySection extends StatelessWidget {
  final List<RestaurantEntity>? restaurants;
  const PopularrestaurantsnearbySection({super.key, this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              maxLines: 2,
              'Popular restaurants nearby',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        RestaurantList(restaurants: restaurants),
      ],
    );
  }
}

class RestaurantList extends StatelessWidget {
  final List<RestaurantEntity>? restaurants;
  const RestaurantList({super.key, this.restaurants});

  @override
  Widget build(BuildContext context) {
    final items = restaurants ?? [
      RestaurantEntity(name: 'Allo Beirut', logoUrl: 'assets/images/food1.png', deliveryTime: '32 mins'),
      RestaurantEntity(name: 'Laffah', logoUrl: 'assets/images/food2.png', deliveryTime: '38 mins'),
      RestaurantEntity(name: 'Falafil Al Rabiah Al kha...', logoUrl: 'assets/images/food3.png', deliveryTime: '44 mins'),
      RestaurantEntity(name: 'Barbar', logoUrl: 'assets/images/food4.png', deliveryTime: '34 mins'),
    ];
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final restaurant = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(restaurant.logoUrl),
                ),
                SizedBox(height: 8),
                Text(
                  restaurant.name,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      restaurant.deliveryTime,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
