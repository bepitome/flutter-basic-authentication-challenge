import 'package:basic_authentication_flutter_challenge/src/domain/clients/local_storage_client.dart';

abstract class LocalDataSource {
  final LocalStorageClient storage;

  const LocalDataSource({required this.storage});
}
