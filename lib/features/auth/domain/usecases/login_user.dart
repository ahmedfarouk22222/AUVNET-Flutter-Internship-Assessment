import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';

import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';


import '../entities/user_entity.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<Either<Failure, UserEntity>> call(
    String email,
    String password,
  ) async {
    return await repository.login(email, password);
  }
}
