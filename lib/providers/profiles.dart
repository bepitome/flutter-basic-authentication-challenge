import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../app_config.dart' as config;
import '../models/profile.dart';

class Profiles with ChangeNotifier {
  List<Profile> _profiles = [];
  final String? authToken;
  final int? userId;
  Profile? mainProfile;

  Profiles(this.authToken, this.userId, this._profiles, this.mainProfile);

  List<Profile> get profiles {
    return [..._profiles];
  }

  Profile get profile {
    return mainProfile!;
  }

  Future<void> loggedinUserProfile() async {
    final url = Uri.parse('${config.apiBaseUrl}/users/$userId');
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': authToken!,
        },
      );
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        // throw HttpException(responseData['result']);
        return;
      }
      final profileData = responseData['result'] as dynamic;
      mainProfile = Profile(
        id: profileData['id'],
        firstName: profileData['first_name'],
        lastName: profileData['last_name'],
        email: profileData['email'],
        username: profileData['username'],
        company: profileData['company'],
        gender: profileData['gender'] == 'Male' ? Gender.male : Gender.female,
      );
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> teamProfiles() async {
    final url = Uri.parse('${config.apiBaseUrl}/users');
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': authToken!,
        },
      );
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        // throw HttpException(responseData['result']);
        return;
      }
      final extractedData = responseData['result'] as List<dynamic>;
      final List<Profile> loadedProfiles = [];
      for (var profileData in extractedData) {
        if (mainProfile?.company == profileData['company'] &&
            mainProfile?.id != profileData['id']) {
          loadedProfiles.add(
            Profile(
              id: profileData['id'],
              firstName: profileData['first_name'],
              lastName: profileData['last_name'],
              email: profileData['email'],
              username: profileData['username'],
              company: profileData['company'],
              gender:
                  profileData['gender'] == 'Male' ? Gender.male : Gender.female,
            ),
          );
        }
      }
      _profiles = loadedProfiles;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
