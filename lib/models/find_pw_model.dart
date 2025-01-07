import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_pw_model.freezed.dart';
part 'find_pw_model.g.dart';

enum FindPWModelType { findPW }

@freezed
class FindPWModel with _$FindPWModel {
  FindPWModel._();
  factory FindPWModel({
    FindPWModelType? type,
    int? statusCode,
    required String statusMessage,
    String? code,
    String? responseTime,
    String? data,
  }) = _FindPwModel;

  factory FindPWModel.fromJson(Map<String, dynamic> json) =>
      _$FindPWModelFromJson(json);

  FindPWModel setType(
    FindPWModelType? type,
  ) =>
      FindPWModel(
          statusMessage: statusMessage,
          type: type,
          statusCode: statusCode,
          code: code,
          responseTime: responseTime,
          data: data);
}

@freezed
class FindPWModelError with _$FindPWModelError implements Error {
  FindPWModelError._();

  factory FindPWModelError({
    FindPWModelType? type,
    int? statusCode,
    required String statusMessage,
    String? code,
    String? responseTime,
    String? data,
  }) = _FindPWModelError;

  factory FindPWModelError.fromJson(Map<String, dynamic> json) =>
      _$FindPWModelErrorFromJson(json);

  FindPWModelError setType(
    FindPWModelType? type,
  ) =>
      FindPWModelError(
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
