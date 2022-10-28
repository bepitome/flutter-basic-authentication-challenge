import 'package:basic_authentication_flutter_challenge/injection.dart';
import 'package:basic_authentication_flutter_challenge/src/data/clients/hive_client.dart';
import 'package:basic_authentication_flutter_challenge/src/data/constants/local_storage_constants.dart';
import 'package:basic_authentication_flutter_challenge/src/services/auth_service.dart';

class CurrenAuthtUser {
  final storage = HiveStorageClient.instance;
  final ditenation = 'authData';

  const CurrenAuthtUser();

  Future<int> getLocalUserId() async {
    final id = await storage.read(
      key: kStorageCurrentUserKey,
      from: ditenation,
    );
    final idAsInteger = int.tryParse(id);
    if (idAsInteger == null) {
      locator<AuthService>().logout();
      throw Exception('Logged out due to an issue, Please sign in again.');
    }
    return idAsInteger;
  }

  Future<void> updateUserIdLocally(int id) async {
    await storage.write(
      key: kStorageCurrentUserKey,
      value: id.toString(),
      to: ditenation,
    );
  }
}
