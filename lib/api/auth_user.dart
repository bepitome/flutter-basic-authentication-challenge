import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Auth {
  final baseUrl = 'http://161.35.99.225/api/v1/auth/login';
  String accessToken = '';
  String id = '';
  static String username = '';
  static String password = '';
  String basicAuth =
      'Basic ${base64.encode(utf8.encode('$username:$password'))}';

  Future<String> getUsername() async {
    return username;
  }

  static void setUsername(String theUsername) async {
    username = theUsername;
  }

  Future<String> getPassword() async {
    return password;
  }

  static void setPassword(String thePassword) async {
    password = thePassword;
  }

  Future<dynamic> userAuth() async {
    String getId = await fetchId();
    String token= await fetchToken();

    final res = await http.get(
        Uri.parse('http://161.35.99.225/api/v1/users/$getId'),
        headers: {HttpHeaders.authorizationHeader: token,});

    return res.body.toString();
  }

  Future fetchId() async {
    final res = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{'Authorization': basicAuth});
    var jsonData = jsonDecode(res.body);
    id = jsonData['result']['id'].toString();
    if (res.statusCode == 200) {
      return id;
    } else {
      throw Exception('Failed to fetch id');
    }
  }



  Future<dynamic> fetchToken() async {
    String accessToken='wrong token';
    final res = await http.post(Uri.parse(baseUrl),
        headers: {HttpHeaders.authorizationHeader: basicAuth});
    String jsonRespone= res.body.toString();
    final jsonData = jsonDecode(jsonRespone);
    accessToken = jsonData['result']['accessToken'];
    if (res.statusCode == 200) {
      return accessToken;
    } else {
      throw Exception('Failed to fetch access token');
    }
  }

  Future fetchUsers() async {
    final res = await http.get(Uri.parse('http://161.35.99.225/api/v1/users'),
        headers:{
          HttpHeaders.authorizationHeader: await fetchToken(),
        });
    return res.body.toString();
  }




}
