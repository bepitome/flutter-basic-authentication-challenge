import 'dart:convert';

import 'package:basic_auth_challenge/core/exception/exception_utils.dart';
import 'package:basic_auth_challenge/data/model/dto/login_dto.dart';
import 'package:basic_auth_challenge/data/model/dto/user_dto.dart';
import 'package:basic_auth_challenge/data/network/client/dio_client.dart';
import 'package:basic_auth_challenge/data/network/constants/network_constants.dart';
import 'package:basic_auth_challenge/data/network/services/app_network_service.dart';
import 'package:dio/dio.dart';

class AppNetworkServiceImpl extends AppNetworkService {
  final DioClient client;

  AppNetworkServiceImpl(this.client);

  @override
  Future<List<UserDto>?> getAllUsers() async {
    try {
      final Response response = await client.dio.get(NetworkConstants.allUsers);

      if (response.data != null) {
        var list = jsonDecode(response.data['result']) as List;
        return list.map((e) => UserDto.fromJson(e)).toList();
      } else {
        throw ExceptionUtils.handleException(response);
      }
    } on Object catch (error) {
      throw ExceptionUtils.handleException(error);
    }
  }

  @override
  Future<UserDto> getUserDetails(int userId) async {
    try {
      final Response response = await client.dio.get(NetworkConstants.allUsers);

      if (response.data != null) {
        return UserDto.fromJson(response.data['result']);
      } else {
        throw ExceptionUtils.handleException(response);
      }
    } on Object catch (error) {
      throw ExceptionUtils.handleException(error);
    }
  }

  @override
  Future<LoginDto> login(String username, password) async {
    try {
      String basicAuth =
          'Basic ${base64.encode(utf8.encode('$username:$password'))}';

      final Response response = await client.dio.post(NetworkConstants.login,
          options: Options(headers: {"Authorization": basicAuth}));

      if (response.data != null) {
        return LoginDto.fromJson(response.data['result']);
      } else {
        throw ExceptionUtils.handleException(response);
      }
    } on Object catch (error) {
      throw ExceptionUtils.handleException(error);
    }
  }
}
