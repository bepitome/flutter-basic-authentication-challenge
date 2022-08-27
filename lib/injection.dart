import 'package:basic_authentication_flutter_challenge/src/data/clients/http_client.dart';
import 'package:basic_authentication_flutter_challenge/src/data/data_sources/remote_data_sources/remote_users_data_source.dart';
import 'package:basic_authentication_flutter_challenge/src/data/repositories/users_repository_impl.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/repositories/users_repository.dart';
import 'package:basic_authentication_flutter_challenge/src/services/access_token.dart';
import 'package:basic_authentication_flutter_challenge/src/services/auth_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

/// This method is called in the main.
///
/// Anything that needs to be injected at app start,
/// should be registered like this `locator.registerSingleton<Type>(object);`
/// So that it can be access anywhere in the app like this `final object = locator<Type>();`
///
Future<void> injecDependencies() async {
  // Initialize the dependencies
  const accessToken = AccessToken();

  const usersRepo = UsersRepositoryImpl(
    remoteDataSource: RemoteUsersDataSource(
      client: HttpClient(accessToken: accessToken),
    ),
  );

  final authService = AuthService(
    client: const HttpClient(accessToken: accessToken),
    usersRepository: usersRepo,
    accessToken: accessToken,
  );
  // -----------------------------

  // Register the dependencies
  locator.registerSingleton<AccessToken>(accessToken);
  locator.registerSingleton<UsersRepository>(usersRepo);
  locator.registerSingleton<AuthService>(authService);
  // -----------------------------
}
