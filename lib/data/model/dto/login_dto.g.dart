// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) => LoginDto(
      json['accessToken'] as String,
      json['id'] as int,
    );

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
      'accessToken': instance.token,
      'id': instance.id,
    };
