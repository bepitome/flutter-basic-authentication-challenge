import 'package:basic_auth_challenge/data/network/services/app_network_service.dart';
import 'package:basic_auth_challenge/data/preference/preference_manager.dart';
import 'package:basic_auth_challenge/domain/entity/login.dart';
import 'package:basic_auth_challenge/domain/entity/user.dart';
import 'package:basic_auth_challenge/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AppNetworkService networkService;
  final PreferenceManager preferenceManager;

  AuthRepositoryImpl(
      {required this.networkService, required this.preferenceManager});

  @override
  Future<List<User>?> getAllUsers() {
    return networkService
        .getAllUsers()
        .then((value) => value?.map((e) => User.fromApiModel(e)).toList());
  }

  @override
  Future<User> getUserDetails(int userId) {
    return networkService
        .getUserDetails(userId)
        .then((value) => User.fromApiModel(value));
  }

  @override
  Future<Login> login(String username, String password) {
    return networkService
        .login(username, password)
        .then((value) => Login.fromApiModel(value));
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return await preferenceManager.getToken() != null;
  }

  @override
  Future<void> logout() {
    return preferenceManager.deleteOnLogout();
  }
}
