import 'package:basic_authentication_flutter_challenge/src/data/models/user.dart';

abstract class UsersDataAPIs {
  const UsersDataAPIs();

  Future<User> find(int id);
  Future<List<User>> all();
  Future<List<User>> getUsersInCompany(String company);
  Future<User> updateOrCreate(User user);
  Future<bool> exists(int id);
}
