import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../model/Auth.dart';
import '../model/UserModal.dart';

final userServicesProvider = Provider<UserServices>((ref) => UserServices());

class UserServices {
  Future<User> getUser(int id, String accessToken) async {
    try {
      Uri url = Uri.parse('http://161.35.99.225/api/v1/users/$id');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': accessToken,
        },
      );

      User user = User.fromJson(jsonDecode(response.body)['result']);


      return user;
    } catch (e) {
      throw Exception('Failed to load user');
    }
  }

  Future<List<User>> getUsersList(String accessToken) async {
    try {
      Uri url = Uri.parse('http://161.35.99.225/api/v1/users');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': accessToken,
        },
      );

      print(jsonDecode(response.body)['result'].length); 
      return User.setUsersList(jsonDecode(response.body)['result']);
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load user');
    }
  }
}
