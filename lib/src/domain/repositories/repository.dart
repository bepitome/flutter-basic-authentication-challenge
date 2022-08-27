import 'package:basic_authentication_flutter_challenge/src/domain/data_sources/remote_data_source.dart';

abstract class Repository {
  const Repository({required this.remoteDataSource});

  final RemoteDataSource remoteDataSource;

  /// add local data source when needed
  ///
  ///
}
