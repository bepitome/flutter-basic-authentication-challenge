import 'package:basic_authentication_flutter_challenge/src/domain/clients/remote_api_client.dart';

abstract class RemoteDataSource {
  final RemoteAPIClient client;

  const RemoteDataSource({required this.client});
}
