import 'package:basic_authentication_flutter_challenge/src/domain/entities/user.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/repositories/users_repository.dart';

class UsersRepositoryImpl extends UsersRepository {
  const UsersRepositoryImpl({required super.remoteDataSource});

  @override
  Future<User> getUser(int id) async {
    final user = await remoteDataSource.getUser(id);
    return user;
  }

  @override
  Future<List<User>> getAllUsers() async {
    final users = await remoteDataSource.getAllUsers();
    return users;
  }

  @override
  Future<List<User>> getUsersWhere(Map<String, dynamic> query) async {
    final users = await remoteDataSource.getUsersWhere(query);
    return users;
  }
}
