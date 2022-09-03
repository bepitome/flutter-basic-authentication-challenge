import 'package:basic_authentication_flutter_challenge/src/domain/clients/local_storage_pool.dart';

/// Every local storage should implement this class

abstract class LocalStorageClient {
  const LocalStorageClient();

  Future<dynamic> read({required String key, required LocalStoragePool from});

  Future<List<dynamic>> readAll({required LocalStoragePool from});

  Future<bool> valueExists(
      {required String key, required LocalStoragePool from});

  Future<void> write({
    required String key,
    required dynamic value,
    required LocalStoragePool to,
  });

  Future<void> writeAll({
    required Map<dynamic, dynamic> entries,
    required LocalStoragePool to,
  });

  Future<void> delete({required String key, required LocalStoragePool from});
}
