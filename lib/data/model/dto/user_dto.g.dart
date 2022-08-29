// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      json['id'] as String,
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
