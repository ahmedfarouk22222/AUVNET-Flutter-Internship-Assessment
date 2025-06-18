import 'package:hive/hive.dart';

part 'user_modell_local.g.dart'; // ده هيتولد تلقائي

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String email;
  @HiveField(2)
  final String addrese;

  UserModel({
    required this.uid,
    required this.email,
    required this.addrese
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      addrese: json['addrese'] ?? '',
    );
  }
}