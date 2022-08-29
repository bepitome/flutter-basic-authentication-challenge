import 'package:basic_auth_challenge/core/utils/device_utils.dart';
import 'package:basic_auth_challenge/data/network/client/dio_client.dart';
import 'package:basic_auth_challenge/data/network/client/dio_config.dart';
import 'package:basic_auth_challenge/data/network/interceptor/auth_interceptor.dart';
import 'package:basic_auth_challenge/data/network/services/app_network_service.dart';
import 'package:basic_auth_challenge/data/network/services/app_network_service_impl.dart';
import 'package:basic_auth_challenge/data/preference/preference_manager.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'app_injection.dart';

mixin DataLayerInjection {
  static Future<void> configureDataModuleInjection() async {
    // interceptors:------------------------------------------------------------
    injector.registerLazySingleton<AuthInterceptor>(
        () => AuthInterceptor(
        id: () async => await injector<PreferenceManager>().getUserId(),
        accessToken: () async => await injector<PreferenceManager>().getToken(),
      ),
    );

    // dio:---------------------------------------------------------------------
    injector.registerLazySingleton<DioConfigs>(
      () => DioConfigs(
        baseUrl: FlavorConfig.instance.variables['baseUrl'],
        connectionTimeout: FlavorConfig.instance.variables['connectionTimeout'],
        receiveTimeout: FlavorConfig.instance.variables['receiveTimeout'],
      ),
    );

    injector.registerLazySingleton<DioClient>(
        () => DioClient(dioConfigs: injector())
        ..addInterceptors(
          [
            injector<AuthInterceptor>(),
          ],
        ),
    );

    // services:----------------------------------------------------------------
    injector.registerLazySingleton<AppNetworkService>(
        () => AppNetworkServiceImpl(injector()));
  }
}
