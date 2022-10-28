import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

/// A helper class for wrapping the 3rd-party Hive package

class HiveStorageClient {
  static const instance = HiveStorageClient._();
  const HiveStorageClient._();

  static Future init() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }

  Future<dynamic> read({
    required String key,
    required String from,
  }) async {
    final box = await Hive.openBox(from);
    return box.get(key);
  }

  Future<List<dynamic>> readAll({required String from}) async {
    final box = await Hive.openBox(from);
    return box.values.toList();
  }

  Future<bool> valueExists({
    required String key,
    required String from,
  }) async {
    final box = await Hive.openBox(from);
    return box.keys.contains(key);
  }

  Future<void> write({
    required String key,
    required dynamic value,
    required String to,
  }) async {
    final box = await Hive.openBox(to);
    return box.put(key, value);
  }

  Future<void> writeAll({
    required Map<dynamic, dynamic> entries,
    required String to,
  }) async {
    final box = await Hive.openBox(to);
    return box.putAll(entries);
  }

  Future<void> delete({
    required String key,
    required String from,
  }) async {
    final box = await Hive.openBox(from);
    return box.delete(key);
  }
}
