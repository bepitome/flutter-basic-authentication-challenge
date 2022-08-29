import 'package:basic_auth_challenge/data/repository/auth_repository_impl.dart';
import 'package:basic_auth_challenge/domain/repository/auth_repository.dart';
import 'package:basic_auth_challenge/domain/usecases/get_user_details_usecase.dart';
import 'package:basic_auth_challenge/domain/usecases/get_user_id_usecase.dart';
import 'package:basic_auth_challenge/domain/usecases/get_users_usecase.dart';
import 'package:basic_auth_challenge/domain/usecases/is_login_usecase.dart';
import 'package:basic_auth_challenge/domain/usecases/login_usecase.dart';
import 'package:basic_auth_challenge/domain/usecases/logout_usecase.dart';

import 'app_injection.dart';

mixin DomainLayerInjection {
  static Future<void> configureDomainModuleInjection() async {
    // repositories:------------------------------------------------------------
    injector.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
          networkService: injector(), preferenceManager: injector()),
    );

    // usecases:------------------------------------------------------------
    injector.registerLazySingleton<GetUserDetailsUseCase>(
      () => GetUserDetailsUseCase(injector()),
    );

    injector.registerLazySingleton<GetUsersUseCase>(
      () => GetUsersUseCase(injector()),
    );
    injector.registerLazySingleton<IsLoginUseCase>(
      () => IsLoginUseCase(injector()),
    );
    injector.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(injector()),
    );
    injector.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(injector()),
    );
    injector.registerLazySingleton<GetUserIdUseCase>(
          () => GetUserIdUseCase(injector()),
    );
  }
}
