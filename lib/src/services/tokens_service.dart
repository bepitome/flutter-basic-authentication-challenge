import 'package:basic_authentication_flutter_challenge/src/data/clients/hive_client.dart';
import 'package:basic_authentication_flutter_challenge/src/data/constants/local_storage_constants.dart';

class TokensService {
  final storage = HiveStorageClient.instance;
  final distenation = 'authData';

  const TokensService();

  Future<String> getLocalAccessToken() async {
    final value = await storage.read(
      key: kStorageTokenKey,
      from: distenation,
    ) as String?;
    return value ?? '';
  }

  Future<void> updateAccessTokenLocally(String token) async {
    await storage.write(
      key: kStorageTokenKey,
      value: token,
      to: distenation,
    );
  }

  Future<void> deleteAccessTokenLocally() async {
    await storage.delete(
      key: kStorageTokenKey,
      from: distenation,
    );
  }
}
