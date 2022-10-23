import 'dart:convert';
import 'dart:io';
import 'package:basic_authentication_flutter_challenge/models/person.dart';
import 'package:http/http.dart' as http;

class Authentication {
  static String accessToken = '';
  static String userId = '';
  static Person person = Person();
  static final List<Person> teamMates = [];

  static Future<bool> login(String username, String password) async {
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
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      userId = decodedData['result']['id'].toString();
      accessToken = decodedData['result']['accessToken'];
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> getUser() async {
    var url = Uri.parse('http://161.35.99.225/api/v1/users/$userId');
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: accessToken,
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      jsonResponse = jsonResponse['result'];
      person = Person.fromJson(jsonResponse);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> getAllUsers() async {
    var url = Uri.parse('http://161.35.99.225/api/v1/users');
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: accessToken,
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      jsonResponse = jsonResponse['result'] as List;
      for (var user in jsonResponse) {
        if (user['company'] == person.company && user['id'] != person.id) {
          Person tempUser = Person();
          tempUser = Person.fromJson(user);
          teamMates.add(tempUser);
        }
      }
      return true;
    } else {
      return false;
    }
  }
}
