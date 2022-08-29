import 'package:basic_auth_challenge/core/di/local_module.dart';
import 'package:basic_auth_challenge/core/di/repository_module.dart';
import 'package:get_it/get_it.dart';

import 'network_modue.dart';

final injector = GetIt.instance;

mixin AuthAppInjection {
  static Future<void> initializeDependencies() async {
    await DataLayerInjection.configureDataModuleInjection();
    await LocalModule.configureLocalModuleInjection();
    await DomainLayerInjection.configureDomainModuleInjection();
  }
}