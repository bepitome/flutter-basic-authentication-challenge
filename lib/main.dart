import 'dart:async';

import 'package:basic_auth_challenge/auth_app.dart';
import 'package:basic_auth_challenge/core/di/app_injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'data/network/constants/network_constants.dart';

void main() => initializeMain(
      () => FlavorConfig(
    name: kReleaseMode ? "Production" : "Development",
    variables: {
      'baseUrl': kReleaseMode ? NetworkConstants.BASE_URL_PRD : NetworkConstants.BASE_URL_DEV,
      'connectionTimeout': NetworkConstants.CONNECTION_TIMEOUT,
      'receiveTimeout': NetworkConstants.RECEIVE_TIMEOUT,
      'isLive': kReleaseMode ? true : false,
    },
  ),
);

typedef FlavorCallback = FlavorConfig Function();
final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

Future<void> initializeMain(FlavorCallback flavorCallback) async {
  await runZonedGuarded(() async {
    flavorCallback();
    await init();

    /// Initialize Hive
    // await Hive.initFlutter();
    // await OroHiveAdapters.register();

    runApp(
      AuthApp(navigator: navigator),
    );
  }, (error, stackTrace) {
      print(error);
  });
}

// general methods:-------------------------------------------------------------
Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initializing dependencies
  await AuthAppInjection.initializeDependencies();

}