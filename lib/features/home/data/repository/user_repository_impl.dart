



import 'package:ecommerce/features/home/data/datasources/home_data_source.dart';

import 'package:ecommerce/features/home/domain/entities/user_entity.dart';
import 'package:ecommerce/features/home/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> getUserInfo() async {
     final userModel = await remoteDataSource.getUserData();
    return userModel as UserEntity;  
  }
}
