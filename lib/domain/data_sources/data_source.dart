import 'package:basic_authentication_flutter_challenge/domain/entities/user.dart';

/// All Data Sources must implements this class, so that they
/// become forced to provide us with the below functions.
///
///
/// Any function that fetchs data, must be defined here.
///

abstract class DataSource {
  const DataSource();

  Future<User> getUser(int id);
  Future<List<User>> getAllUsers();
  Future<List<User>> getUsersWhere(Map<String, dynamic> query);
}
