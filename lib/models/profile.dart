import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

enum Gender {
  male,
  female,
}

@JsonSerializable()
class Profile {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String company;
  final Gender gender;

  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.company,
    required this.gender,
  });

  static Profile get dummyProfile {
    return Profile(
      id: 1,
      firstName: 'test',
      lastName: 'test',
      email: 'test@test.com',
      username: 'test',
      company: 'test',
      gender: Gender.male,
    );
  }

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
