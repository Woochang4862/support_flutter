import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_pw_model.freezed.dart';
part 'change_pw_model.g.dart';

enum ChangePWModelType { changePW }

@freezed
class ChangePWModel with _$ChangePWModel {
  ChangePWModel._();
  factory ChangePWModel({
    ChangePWModelType? type,
    int? statusCode,
    required String statusMessage,
    String? code,
    String? responseTime,
    String? data,
  }) = _ChangePwModel;

  factory ChangePWModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePWModelFromJson(json);

  ChangePWModel setType(
    ChangePWModelType? type,
  ) =>
      ChangePWModel(
          statusMessage: statusMessage,
          type: type,
          statusCode: statusCode,
          code: code,
          responseTime: responseTime,
          data: data);
}

@freezed
class ChangePWModelError with _$ChangePWModelError implements Error {
  ChangePWModelError._();

  factory ChangePWModelError({
    ChangePWModelType? type,
    int? statusCode,
    required String statusMessage,
    String? code,
    String? responseTime,
    String? data,
  }) = _ChangePWModelError;

  factory ChangePWModelError.fromJson(Map<String, dynamic> json) =>
      _$ChangePWModelErrorFromJson(json);

  ChangePWModelError setType(
    ChangePWModelType? type,
  ) =>
      ChangePWModelError(
        statusMessage: statusMessage,
        type: type,
        statusCode: statusCode,
        code: code,
        responseTime: responseTime,
        data: data,
      );

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
