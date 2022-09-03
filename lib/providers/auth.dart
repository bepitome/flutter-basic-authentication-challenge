import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _token;
  String? _userName;
  int? _userId;

  bool get isAuth {
    return _token != null;
  }

  String? get token {
    return _token;
  }

  String? get userName {
    return _userName;
  }

  int? get userId {
    return _userId;
  }

  Future<void> login(String? userName, String? password) async {
    final url = Uri.parse('http://161.35.99.225/api/v1/auth/login');
    final bytes = utf8.encode('$userName:$password');
    final basicAuthText = base64.encode(bytes);
    try {
      final response = await http.post(
        url,
        // body: json.encode(
        //   {
        //     'userName': userName,
        //     'password': password,
        //   },
        // ),
        headers: {
          'Authorization': 'basic $basicAuthText',
        },
      );
      final responseData = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw HttpException(responseData['result']);
      }
      _token = responseData['result']['accessToken'];
      _userId = responseData['result']['id'];
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
