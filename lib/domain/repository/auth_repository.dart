import 'package:basic_auth_challenge/domain/entity/login.dart';
import 'package:basic_auth_challenge/domain/entity/user.dart';

abstract class AuthRepository {
  Future<List<User>?> getAllUsers();

  Future<User> getUserDetails(int userId);

  Future<Login> login(String username, String password);

  Future<bool> isUserLoggedIn();

  Future<void> logout();
}