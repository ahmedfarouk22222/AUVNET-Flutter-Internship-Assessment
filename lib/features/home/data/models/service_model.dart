import '../../domain/entities/service_entity.dart';
import 'package:hive/hive.dart';
part 'service_model.g.dart';

@HiveType(typeId: 1)
class ServiceModel extends ServiceEntity {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final String subtitle;

  const ServiceModel({
    required this.title,
    required this.imageUrl,
    required this.subtitle,
  }) : super(title: title, imageUrl: imageUrl, subtitle: subtitle);

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      title: json['title'],
      imageUrl: json['imageUrl'],
      subtitle: json['subtitle'],
    );
  }

  Map<String, dynamic> toJson() => {
    'imageUrl': imageUrl,
    'title': title,
    'subtitle': subtitle,
  };
}
