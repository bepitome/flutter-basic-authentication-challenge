import 'package:basic_authentication_flutter_challenge/data/clients/http_client.dart';
import 'package:basic_authentication_flutter_challenge/data/data_sources/remote_data_sources/remote_users_data_source.dart';
import 'package:basic_authentication_flutter_challenge/data/repositories/users_repository_impl.dart';
import 'package:basic_authentication_flutter_challenge/domain/repositories/users_repository.dart';
import 'package:basic_authentication_flutter_challenge/services/access_token.dart';
import 'package:basic_authentication_flutter_challenge/services/auth_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

/// This method is called in the main.
///
/// Anything that needs to be injected at app start,
/// should be included inside this method.
///
Future<void> injecDependencies() async {
  const accessToken = AccessToken();
  locator.registerSingleton<AccessToken>(accessToken);

  const usersRepo = UsersRepositoryImpl(
    remoteDataSource: RemoteUsersDataSource(
      client: HttpClient(accessToken: accessToken),
    ),
  );
  locator.registerSingleton<UsersRepository>(usersRepo);

  const authService = AuthService(
    client: HttpClient(accessToken: accessToken),
    usersRepository: usersRepo,
    accessToken: accessToken,
  );
  locator.registerSingleton<AuthService>(authService);
}
