import 'package:basic_authentication_flutter_challenge/src/domain/clients/api_client.dart';

abstract class RemoteDataSource {
  final APIClient client;

  const RemoteDataSource({required this.client});
}
