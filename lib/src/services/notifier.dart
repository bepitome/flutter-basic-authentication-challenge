import 'package:flutter/material.dart';

/// A service for showing snackbars messages to the user

class Notifier {
  static final kMessengerKey = GlobalKey<ScaffoldMessengerState>();
  const Notifier();

  void show(String message) {
    final snack = SnackBar(content: Text(message.toString()));
    kMessengerKey.currentState?.showSnackBar(snack);
  }
}
