import '../../domain/entities/restaurant_entity.dart';
import 'package:hive/hive.dart';
part 'restaurant_model.g.dart';

@HiveType(typeId: 2)
class RestaurantModel extends RestaurantEntity {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String logoUrl;
  @HiveField(2)
  final String deliveryTime;

  const RestaurantModel({
    required this.name,
    required this.logoUrl,
    required this.deliveryTime,
  }) : super(name: name, logoUrl: logoUrl, deliveryTime: deliveryTime);

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      name: json['title'],
      logoUrl: json['imageUrl'],
      deliveryTime: json['subtitle'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': name,
    'imageUrl': logoUrl,
    'subtitle': deliveryTime,
  };
}
