import 'package:basic_auth_challenge/data/model/dto/login_dto.dart';

class Login {
  final String token;
  final int id;

  Login(this.token, this.id);

  factory Login.fromApiModel(LoginDto dto)
  {
    return Login(dto.token, dto.id);
  }
}