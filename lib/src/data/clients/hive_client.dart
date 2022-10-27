import 'package:basic_authentication_flutter_challenge/src/domain/clients/local_storage_client.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

/// A helper class for wrapping the 3rd-party package

class HiveStorageClient implements LocalStorageClient {
  const HiveStorageClient();

  static Future init() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }

  @override
  Future<dynamic> read({
    required String key,
    required String from,
  }) async {
    final box = await Hive.openBox(from);
    return box.get(key);
  }

  @override
  Future<List<dynamic>> readAll({required String from}) async {
    final box = await Hive.openBox(from);
    return box.values.toList();
  }

  @override
  Future<bool> valueExists({
    required String key,
    required String from,
  }) async {
    final box = await Hive.openBox(from);
    return box.keys.contains(key);
  }

  @override
  Future<void> write({
    required String key,
    required dynamic value,
    required String to,
  }) async {
    final box = await Hive.openBox(to);
    return box.put(key, value);
  }

  @override
  Future<void> writeAll({
    required Map<dynamic, dynamic> entries,
    required String to,
  }) async {
    final box = await Hive.openBox(to);
    return box.putAll(entries);
  }

  @override
  Future<void> delete({
    required String key,
    required String from,
  }) async {
    final box = await Hive.openBox(from);
    return box.delete(key);
  }
}
