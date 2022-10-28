import 'package:basic_authentication_flutter_challenge/src/data/constants/api_constants.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/data/model.dart';

class User extends Model {
  final String firstName, lastName, email, username, company, gender;

  const User({
    super.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.company,
    required this.gender,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: (map[kApiUserIdKey] as int?).toString(),
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

  @override
  String toString() {
    return '{$firstName, $lastName, $email, $username, $company, $gender}';
  }
}
