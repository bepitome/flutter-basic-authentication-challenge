import 'package:basic_authentication_flutter_challenge/src/data/models/user_model.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/data_sources/local/local_data_source.dart';
import 'package:basic_authentication_flutter_challenge/src/services/local_storage.dart';

class LocalUsersDataSource extends LocalDataSource {
  const LocalUsersDataSource({required super.storage});

  Future<UserModel> getUser(int id) async {
    final value = await storage.read(
      key: id.toString(),
      from: LocalStoragePool.users,
    );
    final map = Map<String, dynamic>.from(value);
    return UserModel.fromMap(map);
  }

  Future<bool> userExists(int id) {
    return storage.valueExists(
      key: id.toString(),
      from: LocalStoragePool.users,
    );
  }

  Future<List<UserModel>> getAllUsers() async {
    final value = await storage.readAll(from: LocalStoragePool.users);
    final list = List<Map<String, dynamic>>.from(value);
    return list.map((map) => UserModel.fromMap(map)).toList();
  }

  Future<List<UserModel>> getUsersInCompany(String company) async {
    final users = await getAllUsers();
    return users.where((user) => user.company == company).toList();
  }

  Future<void> updateOrCreateUser(int id, Map<String, dynamic> map) async {
    final user = UserModel.fromMap(map);
    if (user.id is! int) return;
    return storage.write(
      key: id.toString(),
      value: user.toMap(),
      to: LocalStoragePool.users,
    );
  }
}
