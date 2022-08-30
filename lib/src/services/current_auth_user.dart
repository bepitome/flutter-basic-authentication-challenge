import 'package:basic_authentication_flutter_challenge/injection.dart';
import 'package:basic_authentication_flutter_challenge/src/data/constants/local_storage_constants.dart';
import 'package:basic_authentication_flutter_challenge/src/services/auth_service.dart';
import 'package:basic_authentication_flutter_challenge/src/services/local_storage.dart';

class CurrenAuthtUser {
  final LocalStorage storage;

  const CurrenAuthtUser({required this.storage});

  Future<int> getLocalUserId() async {
    final id = await storage.read(
      key: kStorageCurrentUserKey,
      from: LocalStoragePool.authData,
    );
    if (int.tryParse(id) == null) {
      locator<AuthService>().logout();
      throw Exception('Logged out due to an issue, Please sign in again.');
    }
    return int.parse(id);
  }

  Future<void> updateUserIdLocally(int id) async {
    await storage.write(
      key: kStorageCurrentUserKey,
      value: id.toString(),
      to: LocalStoragePool.authData,
    );
  }
}