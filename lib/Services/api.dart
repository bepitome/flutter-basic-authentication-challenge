import 'dart:convert';
import 'dart:io';
import 'package:basic_authentication_flutter_challenge/models/person.dart';
import 'package:http/http.dart' as http;

class Authentication {
  static String accessToken = '';
  static String userId = '';
  static bool loginStatus = false;
  static Person person = Person();

  static Future login(String username, String password) async {
    String credentials = "$username:$password";
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);
    var url = Uri.parse('http://161.35.99.225/api/v1/auth/login');
    var response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Basic $encoded',
      },
    );
    try {
      if (response.statusCode == 200) {
        var decodedData = json.decode(response.body);
        userId = decodedData['result']['id'].toString();
        accessToken = decodedData['result']['accessToken'];
        loginStatus = true;
      }
    } catch (e) {
      loginStatus = false;
      throw Exception(e.toString());
    }
  }

  static Future getUser() async {
    var url = Uri.parse('http://161.35.99.225/api/v1/users/$userId');
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: accessToken,
      },
    );
    try {
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        jsonResponse = jsonResponse['result'];
        person = Person.fromJson(jsonResponse);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
