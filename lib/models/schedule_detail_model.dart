// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_detail_model.freezed.dart';
part 'schedule_detail_model.g.dart';

enum ScheduleDetailModelType {
  fetch,
  update,
  delete,
  create,
}

@freezed
class ScheduleDetailModel with _$ScheduleDetailModel {
  ScheduleDetailModel._();
  @JsonSerializable(explicitToJson: true)
  factory ScheduleDetailModel({
    @JsonKey(name: "statusCode") required int statusCode,
    @JsonKey(name: "statusMessage") required String statusMessage,
    @JsonKey(name: "responseTime") required String responseTime,
    @JsonKey(name: "data") Data? data,
    @JsonKey(name: "code") required String code,
    ScheduleDetailModelType? type,
  }) = _ScheduleDetailModel;

  factory ScheduleDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDetailModelFromJson(json);

  ScheduleDetailModel setType(ScheduleDetailModelType type) =>
      ScheduleDetailModel(
        statusCode: statusCode,
        statusMessage: statusMessage,
        responseTime: responseTime,
        data: data,
        code: code,
        type: type,
      );
}

@freezed
class Data with _$Data {
  factory Data({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "content") required String content,
    @JsonKey(name: "startDate") required String startDate,
    @JsonKey(name: "endDate") required String endDate,
    @JsonKey(name: "color") required int color,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class ScheduleDetailModelError
    with _$ScheduleDetailModelError
    implements Error {
  ScheduleDetailModelError._();
  @JsonSerializable(explicitToJson: true)
  factory ScheduleDetailModelError({
    @JsonKey(name: "statusCode") required int statusCode,
    @JsonKey(name: "statusMessage") required String statusMessage,
    @JsonKey(name: "code") required String code,
    ScheduleDetailModelType? type,
  }) = _ScheduleDetailModelError;

  factory ScheduleDetailModelError.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDetailModelErrorFromJson(json);

  ScheduleDetailModelError setType(ScheduleDetailModelType type) =>
      ScheduleDetailModelError(
        statusCode: statusCode,
        statusMessage: statusMessage,
        code: code,
        type: type,
      );

  @override
  StackTrace? get stackTrace => StackTrace.fromString(toString());
}
