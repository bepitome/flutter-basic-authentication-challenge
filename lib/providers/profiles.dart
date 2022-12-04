import 'dart:async';

import 'package:flutter/widgets.dart';

import '../models/profile.dart';
import '../repository/profile_repository.dart' as profile_repos;

class Profiles with ChangeNotifier {
  List<Profile> _profiles = [];
  final String? authToken;
  final int? userId;
  Profile? mainProfile;

  Profiles({
    required this.authToken,
    required this.userId,
    required this.mainProfile,
  });

  List<Profile> get profiles {
    return [..._profiles];
  }

  Profile get profile {
    return mainProfile!;
  }

  Future<void> loggedinUserProfile() async {
    mainProfile = await profile_repos.fetchAndSetProfile(authToken!, userId!);
    notifyListeners();
  }

  Future<void> teamProfiles() async {
    var loadedProfiles = await profile_repos.fetchAndSetProfiles(authToken!);
    List<Profile> sameCompProfiles = [];
    for (var profileData in loadedProfiles) {
      if (mainProfile?.company == profileData.company &&
          mainProfile?.id != profileData.id) {
        sameCompProfiles.add(profileData);
      }
    }
    _profiles = sameCompProfiles;
    notifyListeners();
  }
}
