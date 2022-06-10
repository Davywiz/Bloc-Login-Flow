import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'userId')
  String? userId;

  RegisterResponse(
    this.message,
    this.userId,
  );

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "userId")
  String? userId;
  LoginResponse({
    this.token,
    this.userId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
