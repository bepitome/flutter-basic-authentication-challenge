import 'package:basic_authentication_flutter_challenge/src/data/constants/keys.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter();

  void open(Widget view) {
    kNavigationKey.currentState?.push(
      MaterialPageRoute(builder: (_) => view),
    );
  }

  void back() {
    kNavigationKey.currentState?.pop();
  }
}
