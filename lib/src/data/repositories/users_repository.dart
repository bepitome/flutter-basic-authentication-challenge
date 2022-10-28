import 'package:basic_authentication_flutter_challenge/src/data/data_sources/local/users/hive_users_local_data_source.dart';
import 'package:basic_authentication_flutter_challenge/src/data/data_sources/remote/users/http_users_remote_data_source.dart';
import 'package:basic_authentication_flutter_challenge/src/data/models/user.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/data/data_apis/users_apis.dart';

class UsersRepository implements UsersDataAPIs {
  final remoteSource = const HttpUsersRemoteDataSource();
  final localSource = const HiveUsersLocalDataSource();

  const UsersRepository();

  @override
  Future<User> find(int id) async {
    // Check if we have data locally.
    final userExists = await localSource.exists(id);
    // If local data exists, return it.
    if (userExists) {
      final localUser = await localSource.find(id);
      return localUser;
    } else {
      // If there is no local data, fetch from remote api.
      final user = await remoteSource.find(id);
      // after fetching, we should update our local storage.
      await localSource.updateOrCreate(user);
      return user;
    }
  }

  // Fetch from remote, for now
  @override
  Future<List<User>> all() {
    return remoteSource.all();
  }

  // Fetch from remote, for now
  @override
  Future<List<User>> getUsersInCompany(String company) async {
    final users = await remoteSource.getUsersInCompany(company);
    return users;
  }

  // Not needed for now
  @override
  Future<User> updateOrCreate(User user) {
    throw Exception();
  }

  @override
  Future<bool> exists(int id) {
    return localSource.exists(id);
  }
}
