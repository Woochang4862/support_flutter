// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_model.freezed.dart';
part 'sign_up_model.g.dart';

enum SignUpModelType { verifyId, verifyCode, signUp }

@freezed
class SignUpModel with _$SignUpModel {
  SignUpModel._();

  @JsonSerializable(explicitToJson: true)
  factory SignUpModel({
    SignUpModelType? type,
    int? statusCode,
    required String statusMessage,
    String? code,
    String? responseTime,
    String? data,
  }) = _SignUpModel;

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  SignUpModel setType(SignUpModelType type) => SignUpModel(
        statusMessage: statusMessage,
        data: data,
        type: type,
        code: code,
        statusCode: statusCode,
        responseTime: responseTime,
      );
}

@freezed
class SignUpModelError with _$SignUpModelError implements Error {
  SignUpModelError._();

  factory SignUpModelError({
    SignUpModelType? type,
    int? statusCode,
    required String statusMessage,
    String? code,
    String? responseTime,
    String? data,
  }) = _SignUpModelError;

  factory SignUpModelError.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelErrorFromJson(json);

  SignUpModelError setType(SignUpModelType type) => SignUpModelError(
        statusMessage: statusMessage,
        data: data,
        type: type,
        code: code,
        statusCode: statusCode,
        responseTime: responseTime,
      );

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
