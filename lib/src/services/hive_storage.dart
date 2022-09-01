import 'package:basic_authentication_flutter_challenge/src/domain/storage/local_storage.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/storage/local_storage_pool.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

/// A helper class for wrapping the 3rd-party package

class HiveStorage implements LocalStorage {
  const HiveStorage();

  static Future init() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }

  @override
  Future<dynamic> read({
    required String key,
    required LocalStoragePool from,
  }) async {
    final box = await Hive.openBox(from.name);
    return box.get(key);
  }

  @override
  Future<List<dynamic>> readAll({required LocalStoragePool from}) async {
    final box = await Hive.openBox(from.name);
    return box.values.toList();
  }

  @override
  Future<bool> valueExists({
    required String key,
    required LocalStoragePool from,
  }) async {
    final box = await Hive.openBox(from.name);
    return box.keys.contains(key);
  }

  @override
  Future<void> write({
    required String key,
    required dynamic value,
    required LocalStoragePool to,
  }) async {
    final box = await Hive.openBox(to.name);
    return box.put(key, value);
  }

  @override
  Future<void> writeAll({
    required Map<dynamic, dynamic> entries,
    required LocalStoragePool to,
  }) async {
    final box = await Hive.openBox(to.name);
    return box.putAll(entries);
  }

  @override
  Future<void> delete({
    required String key,
    required LocalStoragePool from,
  }) async {
    final box = await Hive.openBox(from.name);
    return box.delete(key);
  }
}
