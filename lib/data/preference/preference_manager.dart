import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  final SharedPreferences _prefs;

  PreferenceManager(this._prefs);

  Future<String?> getToken() async {
    final SharedPreferences prefs = _prefs;
    return prefs.getString(_TOKEN);
  }

  Future<void> setToken(String token) async {
    final SharedPreferences prefs = _prefs;
    await prefs.setString(_TOKEN, token);
  }

  Future<void> deleteOnLogout() async {
    final SharedPreferences prefs = _prefs;
    await prefs.remove(_TOKEN);
  }

  // User Id
  Future<String?> getUserId() async {
    final SharedPreferences prefs = _prefs;
    return prefs.getString(_USER_ID);
  }

  Future<void> setUserId(String userId) async {
    final SharedPreferences prefs = _prefs;
    await prefs.setString(_USER_ID, userId);
  }

  final _TOKEN = 'token';
  final _USER_ID = 'user_id';
}
