import 'package:basic_authentication_flutter_challenge/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:basic_authentication_flutter_challenge/src/services/auth_service.dart';

class SignInViewModel extends BaseViewModel {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future login() async {
    if (isFormValid()) {
      _setLoading(true);
      try {
        await locator<AuthService>().login(
          usernameController.text,
          passwordController.text,
        );
      } catch (e) {
        // TODO for future
        // Show alert to the user
      }
      _setLoading(false);
    }
  }

  bool isFormValid() {
    return formKey.currentState?.validate() ?? false;
  }

  String? usernameValidator(String? value) {
    if (value is! String || value.isEmpty) {
      return 'Username can\'t be empty';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value is! String || value.isEmpty) {
      return 'Password can\'t be empty';
    }
    return null;
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}