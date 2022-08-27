import 'package:basic_authentication_flutter_challenge/data/constants/api_constants.dart';
import 'package:basic_authentication_flutter_challenge/data/models/user_model.dart';
import 'package:basic_authentication_flutter_challenge/domain/data_sources/remote_data_source.dart';
import 'package:basic_authentication_flutter_challenge/domain/entities/user.dart';

class RemoteUsersDataSource extends RemoteDataSource {
  const RemoteUsersDataSource({required super.client});

  @override
  Future<User> getUser(int id) async {
    final map = await client.get(endPoint: '$kUsersEndPoint/$id');
    return UserModel.fromMap(map as Map<String, dynamic>);
  }

  @override
  Future<List<User>> getAllUsers() async {
    final list = await client.get(endPoint: kUsersEndPoint) as List;
    return list.map((map) => UserModel.fromMap(map)).toList();
  }

  @override
  Future<List<User>> getUsersWhere(Map<String, dynamic> query) async {
    final list = await client.get(
      endPoint: kUsersEndPoint,
      query: query,
    ) as List;
    return list.map((map) => UserModel.fromMap(map)).toList();
  }
}
