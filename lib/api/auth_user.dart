import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


class Auth {
  final baseUrl = 'http://161.35.99.225/api/v1/auth/login';
   String accessToken = '';
   var id=0;
  static String username = '';
  static String password = '';
  String basicAuth =
      'Basic ${base64.encode(utf8.encode('$username:$password'))}';

  String getUsername()  {
    return username;
  }

  static void setUsername(String theUsername) async {
    username = theUsername;
  }

  String getPassword()  {
    return password;
  }

  static void setPassword(String thePassword) async {
    password = thePassword;
  }

  Future<dynamic> userAuth() async {

    String token= await fetchToken();
    var userid = await fetchId();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token
    };


    final res = await http.get(
        Uri.parse('http://161.35.99.225/api/v1/users/$userid'),
        headers:
          requestHeaders);


    return res.body;
  }

  Future fetchId() async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    final res = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{'Authorization': basicAuth});
    var jsonData = jsonDecode(res.body);
    if (res.statusCode == 200) {
      id = jsonData['result']['id'];
      accessToken = jsonData['result']['accessToken'];
      return id;
    } else {
      throw Exception(jsonData);
    }
  }

  Future fetchToken() async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    final res = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{'Authorization': basicAuth});
    var jsonData = jsonDecode(res.body);
    if (res.statusCode == 200) {
      id = jsonData['result']['id'];
      accessToken = jsonData['result']['accessToken'];
      return accessToken;
    } else {
      throw Exception(jsonData);
    }
  }

  Future fetchUsers() async {
    final res = await http.get(Uri.parse('http://161.35.99.225/api/v1/users'),
        headers:{
          HttpHeaders.authorizationHeader: await fetchToken(),
        });
    return res.body;
  }
}