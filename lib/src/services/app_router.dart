import 'package:basic_authentication_flutter_challenge/src/data/constants/keys.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/view/view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter();

  void open(View view) {
    kNavigationKey.currentState?.push(
      MaterialPageRoute(builder: (_) => view),
    );
  }

  void back() {
    kNavigationKey.currentState?.pop();
  }
}
