import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Authentication {
  static String username = '';
  static String password = '';
  static String accessToken = '';
  static String userId = '';

  static Future<String> getUserId() async {
    String userId = '';

    try {
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
      var decodedData = json.decode(response.body);
      userId = decodedData['result']['id'].toString();
      return userId;
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> getUser() async {
    String userId = await getUserId();

    try {
      var url = Uri.parse('http://161.35.99.225/api/v1/users/:$userId');
      var response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: await getAccessToken(),
        },
      );

      return response.body;
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> getAccessToken() async {
    String accessToken = 'error';

    try {
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

    return response.body;
  }
}
