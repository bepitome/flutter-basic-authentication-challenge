import 'package:basic_authentication_flutter_challenge/src/domain/entities/user.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/repositories/users_repository.dart';

class UsersRepositoryImpl extends UsersRepository {
  const UsersRepositoryImpl({
    required super.remoteSource,
    required super.localSource,
  });

  @override
  Future<User> getUser(int id) async {
    // Check if we have data locally.
    final userExists = await localSource.userExists(id);
    // If local data exists, return it.
    if (userExists) {
      final localUser = await localSource.getUser(id);
      return localUser;
    } else {
      // If there is no local data, fetch from remote api.
      final user = await remoteSource.getUser(id);
      // after fetching, we should update our local storage.
      await localSource.updateOrCreateUser(
        id,
        user.toMap(),
      );
      return user;
    }
  }

  // Fetch from remote, for now
  @override
  Future<List<User>> getAllUsers() {
    return remoteSource.getAllUsers();
  }

  // Fetch from remote, for now
  @override
  Future<List<User>> getUsersInCompany(String company) async {
    final users = await remoteSource.getUsersInCompany(company);
    return users;
  }

  // Not needed for now
  @override
  Future<void> updateOrCreateUser(int id, Map<String, dynamic> value) {
    throw Exception();
  }
}
