import 'package:basic_auth_challenge/data/model/dto/user_dto.dart';

class User {

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String company;
  final String gender;

  factory User.fromApiModel(UserDto dto) {
    return User(
        dto.id,
        dto.firstName,
        dto.lastName,
        dto.email,
        dto.username,
        dto.company,
        dto.gender);
  }

  User(this.id, this.firstName, this.lastName, this.email, this.username,
      this.company, this.gender);
}