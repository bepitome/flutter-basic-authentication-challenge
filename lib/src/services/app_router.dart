import 'package:basic_authentication_flutter_challenge/src/domain/view/view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static final routerKey = GlobalKey<NavigatorState>();
  const AppRouter();

  void open(View view) {
    routerKey.currentState?.push(
      MaterialPageRoute(builder: (_) => view),
    );
  }

  void back() {
    routerKey.currentState?.pop();
  }
}
