import 'package:basic_authentication_flutter_challenge/injection.dart';
import 'package:basic_authentication_flutter_challenge/src/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class AppViewModel extends BaseViewModel {
  bool isLoading = false;
  bool isAuthenticated = false;
  final _auth = locator<AuthService>();

  AppViewModel() {
    _checkIfAuthenticated();
    _auth.addListener(() {
      _checkIfAuthenticated();
    });
  }

  Future<void> _checkIfAuthenticated() async {
    _setLoading(true);
    isAuthenticated = await _auth.isAuthenticated();
    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
