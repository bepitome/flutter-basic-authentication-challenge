import 'package:basic_auth_challenge/data/model/dto/login_dto.dart';
import 'package:basic_auth_challenge/data/model/dto/user_dto.dart';

abstract class AppNetworkService
{
  Future<LoginDto> login(String username, password);
  Future<List<UserDto>?> getAllUsers();
  Future<UserDto> getUserDetails(int userId);
}