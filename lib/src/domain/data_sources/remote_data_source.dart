import 'package:basic_authentication_flutter_challenge/src/domain/clients/api_client.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/data_sources/data_source.dart';

abstract class RemoteDataSource implements DataSource {
  const RemoteDataSource({required this.client});

  final APIClient client;
}
