import 'package:flutter/material.dart';

class AppRouter {
  static final kNavigationKey = GlobalKey<NavigatorState>();
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
