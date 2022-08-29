import 'package:json_annotation/json_annotation.dart';

part 'login_dto.g.dart';

@JsonSerializable()
class LoginDto {

  @JsonKey(name: 'accessToken')
  final String token;

  @JsonKey(name: 'id')
  final int id;

  factory LoginDto.fromJson(Map<String, dynamic> json) => _$LoginDtoFromJson(json);

  LoginDto(this.token, this.id);

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);
}