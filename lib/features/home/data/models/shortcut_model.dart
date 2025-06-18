import '../../domain/entities/shortcut_entity.dart';

class ShortcutModel extends ShortcutEntity {
  const ShortcutModel({required super.title, required super.iconUrl});

  factory ShortcutModel.fromJson(Map<String, dynamic> json) {
    return ShortcutModel(title: json['title'], iconUrl: json['icon_url']);
  }

  Map<String, dynamic> toJson() => {'title': title, 'icon_url': iconUrl};
}
