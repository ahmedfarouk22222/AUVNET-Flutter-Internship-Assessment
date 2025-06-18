import 'package:ecommerce/features/home/data/datasources/home_data_source.dart';

import 'package:ecommerce/features/home/data/models/shortcut_model.dart';
import 'package:ecommerce/features/home/domain/entities/shortcut_entity.dart';
import 'package:ecommerce/features/home/domain/repository/shortcut_repository.dart';


class ShortcutRepositoryImpl implements ShortcutRepository {
  final ShortcutRemoteDataSource remoteDataSource;

  ShortcutRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ShortcutEntity>> getShortcuts() async {
    final List<ShortcutModel> data = await remoteDataSource.getShortcuts();
    return data;
  }
}
