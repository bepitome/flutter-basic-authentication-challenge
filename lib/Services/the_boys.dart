import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:basic_authentication_flutter_challenge/Services/api.dart';
import 'package:basic_authentication_flutter_challenge/models/person.dart';

class TheBoys {
  static final List<Person> teamMates = [];
  static Future getAllUsers() async {
    var url = Uri.parse('http://161.35.99.225/api/v1/users');
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: Authentication.accessToken,
      },
    );
    try {
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        jsonResponse = jsonResponse['result'] as List;
        for (var user in jsonResponse) {
          if (user['company'] == Authentication.person.company &&
              user['id'] != Authentication.userId) {
            Person tempUser = Person();
            tempUser = Person.fromJson(user);

            teamMates.add(tempUser);
          }
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
