import 'package:basic_authentication_flutter_challenge/src/data/data_sources/local_data_sources/local_users_data_source.dart';
import 'package:basic_authentication_flutter_challenge/src/data/data_sources/remote_data_sources/remote_users_data_source.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/entities/user.dart';

abstract class UsersRepository {
  final RemoteUsersDataSource remoteSource;
  final LocalUsersDataSource localSource;

  const UsersRepository({
    required this.remoteSource,
    required this.localSource,
  });

  Future<User> getUser(int id);
  Future<List<User>> getAllUsers();
  Future<void> updateOrCreateUser(int id, Map<String, dynamic> value);
  Future<List<User>> getUsersInCompany(String company);
}
