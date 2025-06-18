import 'package:ecommerce/features/home/domain/repository/user_repository.dart';

import '../entities/user_entity.dart';


class GetUserInfo {
  final UserRepository repository;

  GetUserInfo(this.repository);

  Future<UserEntity> call() async {
    return await repository.getUserInfo();
  }
}
