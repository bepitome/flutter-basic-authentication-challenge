import 'dart:convert';
import 'package:app/API/user.dart';
import 'package:http/http.dart' as http;

class Auth {
  static String accessToken = "";
  static int userID = 0;
  static User user = User();
  static List<User> allUsers = [];

  // Function to login
  static Future<bool> login(var basicAuth) async {
    var url = Uri.parse('http://161.35.99.225/api/v1/auth/login');
    var response = await http
        .post(url, headers: <String, String>{'authorization': basicAuth});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      jsonResponse = jsonResponse['result'];
      Auth.accessToken = jsonResponse['accessToken'];
      Auth.userID = jsonResponse['id'];
      return true;
    } else {
      return false;
    }
  }

  // function to store users assuming that the user is logged in
  static Future storeUser() async {
    var url = Uri.parse('http://161.35.99.225/api/v1/users/$userID');
    var response = await http.get(
      url,
      headers: <String, String>{'authorization': accessToken},
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      jsonResponse = jsonResponse['result'];
      user = User.fromJson(jsonResponse);
      return true;
    } else {
      return false;
    }
  }

  // function to store all users assuming that the user is logged in
  static Future storeAllUsers() async {
    var url = Uri.parse('http://161.35.99.225/api/v1/users');
    var response = await http.get(
      url,
      headers: <String, String>{'authorization': accessToken},
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      jsonResponse = jsonResponse['result'] as List;
      allUsers = [];
      for (var key in jsonResponse) {
        if (key['company'] == user.company && key['id'] != userID) {
          User person = User();
          person = User.fromJson(key);
          allUsers.add(person);
        }
      }
      return true;
    } else {
      return false;
    }
  }
}
