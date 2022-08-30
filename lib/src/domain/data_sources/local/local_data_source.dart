import 'package:basic_authentication_flutter_challenge/src/services/local_storage.dart';

abstract class LocalDataSource {
  final LocalStorage storage;

  const LocalDataSource({required this.storage});
}
