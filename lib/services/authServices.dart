import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../model/Auth.dart';
import '../model/UserModal.dart';

final authServicesProvider = Provider<AuthServices>((ref) => AuthServices());

class AuthServices {
  Future<Auth> getAuth(String username, String password) async {
    try {
      Uri url = Uri.parse('http://161.35.99.225/api/v1/auth/login');
      final String base64Str = base64Encode(utf8.encode('$username:$password'));
      print(base64Str);
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Basic $base64Str',
        },
      );
      return Auth.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(
        e.toString(),
      );
      throw Exception('Failed to load user');
    }
  }
}
