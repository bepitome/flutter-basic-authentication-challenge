import 'dart:convert';
import 'package:basic_authentication_flutter_challenge/src/domain/clients/api_client.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/entities/user.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/repositories/users_repository.dart';
import 'package:basic_authentication_flutter_challenge/src/services/access_token.dart';

class AuthService {
  final APIClient client;
  final UsersRepository usersRepository;

  final AccessToken accessToken;

  const AuthService({
    required this.client,
    required this.usersRepository,
    required this.accessToken,
  });

  Future<User> login(String username, String password) async {
    String base64Encoded = base64.encode(utf8.encode('$username:$password'));
    await accessToken.update('Basic $base64Encoded');
    final result = await client.post(endPoint: '/auth/login');
    final newToken = result['accessToken'];
    await accessToken.update(newToken);
    return await usersRepository.getUser(result['id']);
  }
}
