import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class auth {
  final base_url = 'http://161.35.99.225/api/v1/auth/login';
  String accessToken = '';
  String id = '';
  static String username = '';
  static String password = '';
  String basicAuth =
      'Basic ' + base64.encode(utf8.encode('$username:$password'));

  Future<String> getUsername() async {
    return username;
  }

  static void setUsername(String Theusername) async {
    username = Theusername;
  }

  Future<String> getPassword() async {
    return password;
  }

  static void setPassword(String ThePassword) async {
    password = ThePassword;
  }

  Future<dynamic> userAuth() async {
    String getId = await fetchId();
    String token= await fetchToken();

    final res = await http.get(
        Uri.parse('http://161.35.99.225/api/v1/users/$getId'),
        headers: {HttpHeaders.authorizationHeader: token,});
    print(res.body.toString());

    return res.body.toString();
  }

  Future fetchId() async {
    final res = await http.post(Uri.parse(base_url),
        headers: <String, String>{'Authorization': basicAuth});
    var jsonData = jsonDecode(res.body);
    id = jsonData['result']['id'].toString();
    print(id);
    if (res.statusCode == 200) {
      return id;
    } else {
      throw Exception('Failed to fetch id');
    }
  }

  Future<dynamic> fetchToken() async {
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    final res = await http.post(Uri.parse(base_url),
        headers: <String, String>{'Authorization': basicAuth});
    var jsonData = jsonDecode(res.body);
    accessToken = jsonData['result']['accessToken'];
    if (res.statusCode == 200) {
      print(accessToken);
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
    print(res.body.toString());
    return res;
  }
}
