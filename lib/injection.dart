import 'package:basic_authentication_flutter_challenge/src/data/data_sources/local_data_sources/local_users_data_source.dart';
import 'package:basic_authentication_flutter_challenge/src/data/data_sources/remote_data_sources/remote_users_data_source.dart';
import 'package:basic_authentication_flutter_challenge/src/data/helper_classes/http_client.dart';
import 'package:basic_authentication_flutter_challenge/src/data/repositories/users_repository_impl.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/repositories/users_repository.dart';
import 'package:basic_authentication_flutter_challenge/src/services/auth_service.dart';
import 'package:basic_authentication_flutter_challenge/src/services/current_auth_user.dart';
import 'package:basic_authentication_flutter_challenge/src/services/local_storage.dart';
import 'package:basic_authentication_flutter_challenge/src/services/app_router.dart';
import 'package:basic_authentication_flutter_challenge/src/services/tokens_service.dart';
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
  await LocalStorage.init();
  const storage = LocalStorage();
  const router = AppRouter();
  const httpClient = HttpClient();
  const usersRepo = UsersRepositoryImpl(
    remoteSource: RemoteUsersDataSource(client: httpClient),
    localSource: LocalUsersDataSource(storage: storage),
  );
  const authUser = CurrenAuthtUser(
    storage: storage,
  );
  const tokens = TokensService(storage: storage);
  final authService = AuthService(
    tokens: tokens,
    authUser: authUser,
  );
  // -----------------------------

  // Register the dependencies
  locator.registerSingleton<AppRouter>(router);
  locator.registerSingleton<LocalStorage>(storage);
  locator.registerSingleton<TokensService>(tokens);
  locator.registerSingleton<HttpClient>(httpClient);
  locator.registerSingleton<AuthService>(authService);
  locator.registerSingleton<CurrenAuthtUser>(authUser);
  locator.registerSingleton<UsersRepository>(usersRepo);
  // -----------------------------
}
