import '../entities/shortcut_entity.dart';

abstract class ShortcutRepository {
  Future<List<ShortcutEntity>> getShortcuts();
}
