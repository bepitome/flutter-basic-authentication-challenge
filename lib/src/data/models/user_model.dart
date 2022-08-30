import 'package:basic_authentication_flutter_challenge/src/data/constants/api_constants.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/entities/user.dart';

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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map[kApiUserIdKey] as int?,
      firstName: map[kApiUserFirstNameKey] as String? ?? 'Not set',
      lastName: map[kApiUserLastNameKey] as String? ?? 'Not set',
      email: map[kApiUserEmailKey] as String? ?? 'Not set',
      username: map[kApiUsernameKey] as String? ?? 'Not set',
      company: map[kApiUserCompanyKey] as String? ?? 'Not set',
      gender: map[kApiUserGenderKey] as String? ?? 'Not set',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      kApiUserIdKey: id,
      kApiUserFirstNameKey: firstName,
      kApiUserLastNameKey: lastName,
      kApiUserEmailKey: email,
      kApiUsernameKey: username,
      kApiUserCompanyKey: company,
      kApiUserGenderKey: gender,
    };
  }
}
