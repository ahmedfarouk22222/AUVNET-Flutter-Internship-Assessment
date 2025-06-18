import 'package:ecommerce/features/home/domain/entities/service_entity.dart';
import 'package:ecommerce/features/home/presentation/widgets/service_section_item.dart';
import 'package:flutter/material.dart';

class ServiceListView extends StatelessWidget {
  final List<ServiceEntity>? services;
  const ServiceListView({super.key, this.services});

  @override
  Widget build(BuildContext context) {
    final items = services ?? [
      ServiceEntity(title: 'Up to 50%', imageUrl: 'assets/images/13 1.png', subtitle: 'Food'),
      ServiceEntity(title: '20mins', imageUrl: 'assets/images/2.png', subtitle: 'Health & wellness'),
      ServiceEntity(title: '15mins', imageUrl: 'assets/images/3.png', subtitle: 'Groceries'),
    ];
    return SizedBox(
      height: 110,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ServicelistViewItem(
              imagePath: item.imageUrl,
              title: item.title,
              subtitle: item.subtitle,
            ),
          );
        },
      ),
    );
  }
}
