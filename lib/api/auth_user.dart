import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


class Auth {
  final baseUrl = 'http://161.35.99.225/api/v1/auth/login';
  String accessToken = '';
  var id;
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
    var arr=await fetchToken();
    print(arr);

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': accessToken
    };

    final res = await http.get(
        Uri.parse('http://161.35.99.225/api/v1/users/$id'),
        headers:requestHeaders);


    print('----------'+res.body);

    return res.body;
  }

  // Future fetchId() async {
  //   final res = await http.post(Uri.parse(baseUrl),
  //       headers: <String, String>{'Authorization': basicAuth});
  //   var jsonData = jsonDecode(res.body);
  //   print(jsonData);
  //   if (res.statusCode == 200) {
  //     id = jsonData['result']['id'];
  //     return id;
  //   } else {
  //     throw Exception('Failed to fetch id');
  //   }
  // }

  Future<dynamic> fetchToken() async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    final res = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{'Authorization': basicAuth});
    var jsonData = jsonDecode(res.body);
    if (res.statusCode == 200) {
      id = jsonData['result']['id'];
      accessToken = jsonData['result']['accessToken'];
      print(accessToken);
      print(id);
      return [accessToken,id];
      // return accessToken;
    } else {
      print(jsonData);
    }
  }

  Future fetchUsers() async {
    final res = await http.get(Uri.parse('http://161.35.99.225/api/v1/users'),
        headers:{
          HttpHeaders.authorizationHeader: await fetchToken(),
        });
    return res;
  }
}