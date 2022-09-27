import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  static String username = '';
  static String password = '';
  static String accessToken = '';
  static String userId = '';

  static Future<dynamic> getUser() async {
    String id = await getUserId();
    try {
      var url = Uri.parse('http://161.35.99.225/api/v1/users/$id');
      var response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: '$accessToken',
        },
      );
      return response.body.toString();
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> getUserId() async {
    String userId = '';

    try {
      String credentials = "${username}:${password}";
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String encoded = stringToBase64.encode(credentials);

      var url = Uri.parse('http://161.35.99.225/api/v1/auth/login');
      var response = await http.post(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Basic ${encoded}',
        },
      );
      var decodedData = json.decode(response.body);
      userId = decodedData['result']['id'].toString();
      return userId;
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> getAccessToken() async {
    String accessToken = 'error';

    try {
      String credentials = "${username}:${password}";
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String encoded = stringToBase64.encode(credentials);

      var url = Uri.parse('http://161.35.99.225/api/v1/auth/login');
      var response = await http.post(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Basic ${encoded}',
        },
      );
      var decodedData = json.decode(response.body);
      accessToken = decodedData['result']['accessToken'];
      return accessToken;
    } catch (e) {
      return 'error';
    }
  }

  static Future<dynamic> getAllUsers() async {
    var url = Uri.parse('http://161.35.99.225/api/v1/users');
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: await getAccessToken(),
      },
    );
    return response;
  }

  static String getUsername() {
    return username;
  }

  static String getPassword() {
    return password;
  }

  static void setUsername(String inputUsername) {
    username = inputUsername;
  }

  static void setPassword(String inputPassword) {
    password = inputPassword;
  }

  static Future<void> setAccessToken() async {
    accessToken = await getAccessToken();
  }

  static void setUserId() async {
    userId = await getUserId();
  }
}
