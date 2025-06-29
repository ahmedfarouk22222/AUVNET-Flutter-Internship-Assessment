import '../../domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUserInfo();
}