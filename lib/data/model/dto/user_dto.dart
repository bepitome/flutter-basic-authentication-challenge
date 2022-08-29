import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'company')
  final String company;

  @JsonKey(name: 'gender')
  final String gender;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  UserDto(this.id, this.firstName, this.lastName, this.email, this.username, this.company, this.gender);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}