
import 'package:ecommerce/features/home/data/models/user_modell_local.dart';
import 'package:hive/hive.dart';

abstract class UserLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getCachedUser();
  Future<void> clearUser();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  static const String boxName = 'userBox';

  @override
  Future<void> cacheUser(UserModel user) async {
    final box = await Hive.openBox<UserModel>(boxName);
    await box.put('user', user);
  }

  @override
  Future<UserModel?> getCachedUser() async {
    final box = await Hive.openBox<UserModel>(boxName);
    return box.get('user');
  }

  @override
  Future<void> clearUser() async {
    final box = await Hive.openBox<UserModel>(boxName);
    await box.delete('user');
  }
}