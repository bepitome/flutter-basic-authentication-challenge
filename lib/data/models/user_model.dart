import 'package:basic_authentication_flutter_challenge/domain/entities/user.dart';

class UserModel extends User {
  final int? id;

  const UserModel({
    this.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.username,
    required super.company,
    required super.gender,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      company: json['company'] as String?,
      gender: json['gender'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'username': username,
      'company': company,
      'gender': gender,
    };
  }
}
