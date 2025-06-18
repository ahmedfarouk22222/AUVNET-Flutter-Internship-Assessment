import 'package:ecommerce/features/home/domain/repository/shortcut_repository.dart';

import '../entities/shortcut_entity.dart';


class GetShortcuts {
  final ShortcutRepository repository;

  GetShortcuts(this.repository);

  Future<List<ShortcutEntity>> call() async {
    return await repository.getShortcuts();
  }
}
