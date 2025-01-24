import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_model.freezed.dart';
part 'notice_model.g.dart';

enum NoticeModelType { fetch, create, update, delete }

@freezed
class NoticeModel with _$NoticeModel {
  NoticeModel._();

  @JsonSerializable(explicitToJson: true)
  factory NoticeModel({
    NoticeModelType? type,
    int? statusCode,
    String? statusMessage,
    String? responseTime,
    required List<Notice> data,
  }) = _NoticeModel;

  factory NoticeModel.fromJson(Map<String, dynamic> json) =>
      _$NoticeModelFromJson(json);

  NoticeModel setType(
    NoticeModelType? type,
  ) =>
      NoticeModel(
        statusMessage: statusMessage,
        data: data,
        type: type,
        statusCode: statusCode,
        responseTime: responseTime,
      );
}

@freezed
class Notice with _$Notice {
  factory Notice({
    required int id,
    required String title,
    required String creationDate,
    required String content,
  }) = _Notice;

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
}

@freezed
class NoticeModelError with _$NoticeModelError implements Error {
  NoticeModelError._();

  factory NoticeModelError({
    NoticeModelType? type,
    int? statusCode,
    String? statusMessage,
    String? responseTime,
    String? data,
    String? code,
  }) = _NoticeModelError;

  factory NoticeModelError.fromJson(Map<String, dynamic> json) =>
      _$NoticeModelErrorFromJson(json);

  NoticeModelError setType(NoticeModelType type) => NoticeModelError(
        statusMessage: statusMessage,
        type: type,
        code: code,
        statusCode: statusCode,
        responseTime: responseTime,
        data: data,
      );

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
