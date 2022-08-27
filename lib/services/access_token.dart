import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AccessToken {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  const AccessToken();

  Future<String> read() async {
    return await _storage.read(key: 'access_token') ?? '';
  }

  Future<void> update(String newToken) async {
    await _storage.write(key: 'access_token', value: newToken);
  }

  Future<bool> isExpired() async {
    final token = await read();
    final decoded = JwtDecoder.tryDecode(token);
    if (decoded == null) {
      return true;
    } else {
      return JwtDecoder.isExpired(token);
    }
  }
}
