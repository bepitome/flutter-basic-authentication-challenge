// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResultDto _$UserResultDtoFromJson(Map<String, dynamic> json) =>
    UserResultDto(
      (json['result'] as List<dynamic>)
          .map((e) => UserDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserResultDtoToJson(UserResultDto instance) =>
    <String, dynamic>{
      'result': instance.data,
    };

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      json['id'] as int,
      json['first_name'] as String,
      json['last_name'] as String,
      json['email'] as String,
      json['username'] as String,
      json['company'] as String,
      json['gender'] as String,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'username': instance.username,
      'company': instance.company,
      'gender': instance.gender,
    };
