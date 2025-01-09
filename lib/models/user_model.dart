// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  UserModel._();
  @JsonSerializable(explicitToJson: true)
  factory UserModel({
    int? statusCode,
    required String statusMessage,
    String? responseTime,
    required LoginData data,
    String? code,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserModel setRole(String? role) => UserModel(
        statusMessage: statusMessage,
        data: data.setRole(role),
        statusCode: statusCode,
        responseTime: responseTime,
        code: code,
      );
}

@freezed
class LoginData with _$LoginData {
  LoginData._();

  factory LoginData({
    required String accessToken,
    String? role,
    required String refreshToken,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  LoginData setRole(String? role) => LoginData(
      accessToken: accessToken, refreshToken: refreshToken, role: role);
}

@freezed
class UserModelError with _$UserModelError implements Error {
  const UserModelError._();
  factory UserModelError({
    int? statusCode,
    required String statusMessage,
    String? code,
    String? responseTime,
  }) = _UserModelError;

  factory UserModelError.fromJson(Map<String, dynamic> json) =>
      _$UserModelErrorFromJson(json);

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
