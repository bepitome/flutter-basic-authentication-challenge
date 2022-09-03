import 'dart:convert';
import 'package:basic_authentication_flutter_challenge/src/data/clients/http_client.dart';
import 'package:basic_authentication_flutter_challenge/src/data/constants/api_constants.dart';
import 'package:basic_authentication_flutter_challenge/src/services/current_auth_user.dart';
import 'package:basic_authentication_flutter_challenge/src/services/tokens_service.dart';
import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  final HttpClient httpClient;
  final TokensService tokens;
  final CurrenAuthtUser authUser;

  AuthService({
    required this.httpClient,
    required this.tokens,
    required this.authUser,
  });

  Future<bool> isAuthenticated() async {
    final token = await tokens.getLocalAccessToken();
    return token.isNotEmpty;
  }

  Future<void> login(String username, String password) async {
    // Do basic auth
    String base64Encoded = base64.encode(utf8.encode('$username:$password'));
    await tokens.updateAccessTokenLocally('Basic $base64Encoded');
    try {
      final result = await httpClient.post(endPoint: kApiLoginEndPoint);

      // Save the new token locally
      final token = result[kApiTokenKey] as String;
      await tokens.updateAccessTokenLocally(token);

      // Save user id locally
      final userId = result[kApiUserIdKey] as int;
      await authUser.updateUserIdLocally(userId);
    } catch (e) {
      // In case of any error, clear the token
      await tokens.deleteAccessTokenLocally();
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await tokens.deleteAccessTokenLocally();
    notifyListeners();
  }
}
