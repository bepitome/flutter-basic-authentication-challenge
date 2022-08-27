import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccessToken {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  const AccessToken();

  Future<String> read() async {
    return await _storage.read(key: 'access_token') ?? '';
  }

  Future<void> update(String newToken) async {
    await _storage.write(key: 'access_token', value: newToken);
  }

  Future<void> delete() async {
    await _storage.delete(key: 'access_token');
  }

  Future<bool> get isValid async {
    final token = await read();
    return token.isNotEmpty;
  }
}
