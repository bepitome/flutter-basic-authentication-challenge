import 'package:basic_authentication_flutter_challenge/src/domain/entities/user.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/repositories/repository.dart';

abstract class UsersRepository extends Repository {
  const UsersRepository({required super.remoteDataSource});

  Future<User> getUser(int id);
  Future<List<User>> getAllUsers();
  Future<List<User>> getUsersWhere(Map<String, dynamic> query);
}
