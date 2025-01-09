import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_model.freezed.dart';
part 'delete_user_model.g.dart';

enum DeleteUserModelType { delete }

@freezed
class DeleteUserModel with _$DeleteUserModel {
  DeleteUserModel._();
  factory DeleteUserModel({
    DeleteUserModelType? type,
    int? statusCode,
    required String statusMessage,
    String? code,
    String? responseTime,
    String? data,
  }) = _DeleteUserModel;

  factory DeleteUserModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserModelFromJson(json);

  DeleteUserModel setType(
    DeleteUserModelType? type,
  ) =>
      DeleteUserModel(
          statusMessage: statusMessage,
          type: type,
          statusCode: statusCode,
          code: code,
          responseTime: responseTime,
          data: data);
}

@freezed
class DeleteUserModelError with _$DeleteUserModelError implements Error {
  DeleteUserModelError._();

  factory DeleteUserModelError({
    DeleteUserModelType? type,
    int? statusCode,
    required String statusMessage,
    String? code,
    String? responseTime,
    String? data,
  }) = _DeleteUserModelError;

  factory DeleteUserModelError.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserModelErrorFromJson(json);

  DeleteUserModelError setType(
    DeleteUserModelType? type,
  ) =>
      DeleteUserModelError(
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
