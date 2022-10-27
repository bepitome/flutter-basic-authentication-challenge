import 'package:basic_authentication_flutter_challenge/src/data/constants/local_storage_constants.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/clients/local_storage_client.dart';

class TokensService {
  final LocalStorageClient storage;
  final ditenation = 'authData';

  const TokensService({required this.storage});

  Future<String> getLocalAccessToken() async {
    final value = await storage.read(
      key: kStorageTokenKey,
      from: ditenation,
    ) as String?;
    return value ?? '';
  }

  Future<void> updateAccessTokenLocally(String token) async {
    await storage.write(
      key: kStorageTokenKey,
      value: token,
      to: ditenation,
    );
  }

  Future<void> deleteAccessTokenLocally() async {
    await storage.delete(
      key: kStorageTokenKey,
      from: ditenation,
    );
  }
}
