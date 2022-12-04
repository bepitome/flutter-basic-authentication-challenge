import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../app_config.dart' as config;
import '../models/profile.dart';

Future<Profile> fetchAndSetProfile(String authToken, int userId) async {
  final url = Uri.parse('${config.apiBaseUrl}/users/$userId');
  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': authToken,
      },
    );
    final responseData = jsonDecode(response.body) as Map<String, dynamic>;
    if (response.statusCode != 200) {
      throw HttpException(responseData['result']);
    }
    final profileData = responseData['result'] as dynamic;
    return Profile.fromJson(profileData);
  } catch (error) {
    rethrow;
  }
}

Future<List<Profile>> fetchAndSetProfiles(String authToken) async {
  final url = Uri.parse('${config.apiBaseUrl}/users');
  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': authToken,
      },
    );
    final responseData = jsonDecode(response.body) as Map<String, dynamic>;
    if (response.statusCode != 200) {
      throw HttpException(responseData['result']);
    }
    final extractedData = responseData['result'] as List<dynamic>;
    final List<Profile> loadedProfiles = [];
    for (var profileData in extractedData) {
      loadedProfiles.add(Profile.fromJson(profileData));
    }
    return loadedProfiles;
  } catch (error) {
    rethrow;
  }
}
