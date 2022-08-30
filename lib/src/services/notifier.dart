import 'package:basic_authentication_flutter_challenge/src/data/constants/keys.dart';
import 'package:flutter/material.dart';

/// A service for showing snackbars messages to the user

class Notifier {
  const Notifier();

  void show(String message) {
    final snack = SnackBar(content: Text(message.toString()));
    kMessengerKey.currentState?.showSnackBar(snack);
  }
}
