import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// A helper class for wrapping the 3rd-party package

class LocalStorage {
  const LocalStorage();

  static Future init() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }

  Future<dynamic> read({
    required String key,
    required LocalStoragePool from,
  }) async {
    final box = await Hive.openBox(from.name);
    return box.get(key);
  }

  Future<List<dynamic>> readAll({required LocalStoragePool from}) async {
    final box = await Hive.openBox(from.name);
    return box.values.toList();
  }

  Future<bool> valueExists({
    required String key,
    required LocalStoragePool from,
  }) async {
    final box = await Hive.openBox(from.name);
    return box.keys.contains(key);
  }

  Future<void> write({
    required String key,
    required dynamic value,
    required LocalStoragePool to,
  }) async {
    final box = await Hive.openBox(to.name);
    return box.put(key, value);
  }

  Future<void> writeAll({
    required Map<dynamic, dynamic> entries,
    required LocalStoragePool to,
  }) async {
    final box = await Hive.openBox(to.name);
    return box.putAll(entries);
  }

  Future<void> delete({
    required String key,
    required LocalStoragePool from,
  }) async {
    final box = await Hive.openBox(from.name);
    return box.delete(key);
  }
}

enum LocalStoragePool {
  authData,
  users,
}
