import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_notice_model.freezed.dart';
part 'delete_notice_model.g.dart';

enum DeleteNoticeModelType { delete }

@freezed
class DeleteNoticeModel with _$DeleteNoticeModel {
  DeleteNoticeModel._();
  factory DeleteNoticeModel({
    DeleteNoticeModelType? type,
    int? statusCode,
    required String statusMessage,
    String? responseTime,
    String? data,
    String? code,
  }) = _DeleteNoticeModel;

  factory DeleteNoticeModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteNoticeModelFromJson(json);

  DeleteNoticeModel setType(
    DeleteNoticeModelType? type,
  ) =>
      DeleteNoticeModel(
        statusMessage: statusMessage,
        type: type,
        statusCode: statusCode,
        responseTime: responseTime,
        data: data,
        code: code,
      );
}

@freezed
class DeleteNoticeModelError with _$DeleteNoticeModelError implements Error {
  DeleteNoticeModelError._();

  factory DeleteNoticeModelError({
    DeleteNoticeModelType? type,
    int? statusCode,
    required String statusMessage,
    String? responseTime,
    String? data,
    String? code,
  }) = _DeleteNoticeModelError;

  factory DeleteNoticeModelError.fromJson(Map<String, dynamic> json) =>
      _$DeleteNoticeModelErrorFromJson(json);

  DeleteNoticeModelError setType(
    DeleteNoticeModelType? type,
  ) =>
      DeleteNoticeModelError(
        statusMessage: statusMessage,
        type: type,
        statusCode: statusCode,
        responseTime: responseTime,
        data: data,
        code: code,
      );

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
