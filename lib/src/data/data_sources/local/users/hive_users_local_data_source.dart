import 'package:basic_authentication_flutter_challenge/src/data/clients/hive_client.dart';
import 'package:basic_authentication_flutter_challenge/src/data/models/user.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/data/data_apis/users_apis.dart';

class HiveUsersLocalDataSource implements UsersDataAPIs {
  final client = HiveStorageClient.instance;
  final distenation = 'users';

  const HiveUsersLocalDataSource();

  @override
  Future<User> find(int id) async {
    final value = await client.read(
      key: id.toString(),
      from: distenation,
    );
    final map = Map<String, dynamic>.from(value);
    return User.fromMap(map);
  }

  @override
  Future<bool> exists(int id) {
    return client.valueExists(
      key: id.toString(),
      from: distenation,
    );
  }

  @override
  Future<List<User>> all() async {
    final value = await client.readAll(from: distenation);
    final list = List<Map<String, dynamic>>.from(value);
    return list.map((map) => User.fromMap(map)).toList();
  }

  @override
  Future<List<User>> getUsersInCompany(String company) async {
    final users = await all();
    return users.where((user) => user.company == company).toList();
  }

  @override
  Future<User> updateOrCreate(User user) async {
    if (user.id is! int) throw Exception('invalid user data');
    await client.write(
      key: user.id.toString(),
      value: user.toMap(),
      to: distenation,
    );
    return user;
  }
}
