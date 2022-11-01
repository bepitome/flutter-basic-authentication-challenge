import 'dart:convert';
import 'package:app/model/user.dart';
import 'package:http/http.dart' as http;

class Auth {
  static String accessToken = "";
  static int userID = 0;
  static User user = User();
  static List<User> allUsers = [];
  static String baseURL = "http://161.35.99.225/api/v1";

  // Function to login
  static Future<bool> login(var basicAuth) async {
    var url = Uri.parse('$baseURL/auth/login');
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

  // function to fetch users assuming that the user is logged in
  static Future fetchUser() async {
    var url = Uri.parse('$baseURL/users/$userID');
    var response = await http.get(
      url,
      headers: <String, String>{'authorization': accessToken},
    );
    if (response.statusCode == 200) {
      storeUser(response);
      return true;
    } else {
      return false;
    }
  }

  // function to fetch all users assuming that the user is logged in
  static Future fetshAllUsers() async {
    var url = Uri.parse('$baseURL/users');
    var response = await http.get(
      url,
      headers: <String, String>{'authorization': accessToken},
    );
    if (response.statusCode == 200) {
      storeAllUsers(response);
      return true;
    } else {
      return false;
    }
  }

  // Function to store user info
  static void storeUser(http.Response response) {
    var jsonResponse = jsonDecode(response.body);
    jsonResponse = jsonResponse['result'];
    user = User.fromJson(jsonResponse);
  }

  // Function to store All user Info
  static void storeAllUsers(http.Response response) {
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
  }
}
