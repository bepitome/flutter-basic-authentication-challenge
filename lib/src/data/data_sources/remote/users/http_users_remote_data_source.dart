import 'package:basic_authentication_flutter_challenge/src/data/clients/http_client.dart';
import 'package:basic_authentication_flutter_challenge/src/data/constants/api_constants.dart';
import 'package:basic_authentication_flutter_challenge/src/data/models/user.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/data/data_apis/users_apis.dart';

class HttpUsersRemoteDataSource implements UsersDataAPIs {
  final client = HttpClient.instance;

  const HttpUsersRemoteDataSource();

  @override
  Future<User> find(int id) async {
    final result = await client.get(endPoint: '$kApiUsersEndPoint/$id');
    final map = result as Map<String, dynamic>;
    return User.fromMap(map);
  }

  @override
  Future<List<User>> all() async {
    final list = await client.get(endPoint: kApiUsersEndPoint) as List;
    return list.map((map) => User.fromMap(map)).toList();
  }

  @override
  Future<List<User>> getUsersInCompany(String company) async {
    final users = await all();
    return users.where((user) => user.company == company).toList();
  }

  @override
  Future<User> updateOrCreate(User user) {
    // not used
    throw Exception();
  }

  @override
  Future<bool> exists(int id) {
    // notused
    throw Exception();
  }
}
