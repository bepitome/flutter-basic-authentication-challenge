import 'package:basic_auth_challenge/core/connectivity/connectivity_store.dart';
import 'package:basic_auth_challenge/data/preference/preference_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_injection.dart';

mixin LocalModule {
  static Future<void> configureLocalModuleInjection() async {
    injector.registerSingleton<ConnectivityStore>(ConnectivityStore());
    // preference manager:------------------------------------------------------
    injector.registerSingletonAsync<SharedPreferences>(
        SharedPreferences.getInstance);
    injector.registerSingleton<PreferenceManager>(
      PreferenceManager(await injector.getAsync<SharedPreferences>()),
    );

    // hive:--------------------------------------------------------------------
   // injector.registerSingleton<ProfileBox>(ProfileBox());
  }
}