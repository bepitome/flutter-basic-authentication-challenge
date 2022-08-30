import 'package:basic_authentication_flutter_challenge/src/data/constants/api_constants.dart';
import 'package:basic_authentication_flutter_challenge/src/data/models/user_model.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/data_sources/remote/remote_data_source.dart';

class RemoteUsersDataSource extends RemoteDataSource {
  const RemoteUsersDataSource({required super.client});

  Future<UserModel> getUser(int id) async {
    final result = await client.get(endPoint: '$kApiUsersEndPoint/$id');
    final map = result as Map<String, dynamic>;
    return UserModel.fromMap(map);
  }

  Future<List<UserModel>> getAllUsers() async {
    final list = await client.get(endPoint: kApiUsersEndPoint) as List;
    return list.map((map) => UserModel.fromMap(map)).toList();
  }

  Future<List<UserModel>> getUsersInCompany(String company) async {
    final users = await getAllUsers();
    return users.where((user) => user.company == company).toList();
  }
}
