/// Every local storage should implement this class

abstract class LocalStorageClient {
  const LocalStorageClient();

  Future<dynamic> read({required String key, required String from});

  Future<List<dynamic>> readAll({required String from});

  Future<bool> valueExists({required String key, required String from});

  Future<void> write({
    required String key,
    required dynamic value,
    required String to,
  });

  Future<void> writeAll({
    required Map<dynamic, dynamic> entries,
    required String to,
  });

  Future<void> delete({required String key, required String from});
}
