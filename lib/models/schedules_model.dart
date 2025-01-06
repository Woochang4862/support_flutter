// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedules_model.freezed.dart';
part 'schedules_model.g.dart';

enum SchedulesModelType { fetch, create, update, delete }

@freezed
class SchedulesModel with _$SchedulesModel {
  SchedulesModel._();

  @JsonSerializable(explicitToJson: true)
  factory SchedulesModel({
    SchedulesModelType? type,
    int? statusCode,
    required String statusMessage,
    String? code,
    String? responseTime,
    List<Schedule>? data,
  }) = _SchedulesModel;

  factory SchedulesModel.fromJson(Map<String, dynamic> json) =>
      _$SchedulesModelFromJson(json);

  SchedulesModel setType(SchedulesModelType type) => SchedulesModel(
        statusMessage: statusMessage,
        data: data,
        type: type,
        code: code,
        statusCode: statusCode,
        responseTime: responseTime,
      );
}

@freezed
class Schedule with _$Schedule {
  factory Schedule({
    required int id,
    required String title,
    required String content,
    required String startDate,
    required String endDate,
    required int color,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}

@freezed
class SchedulesModelError with _$SchedulesModelError implements Error {
  SchedulesModelError._();

  factory SchedulesModelError({
    SchedulesModelType? type,
    int? statusCode,
    required String statusMessage,
    String? code,
    String? responseTime,
    String? data,
  }) = _SchedulesModelError;

  factory SchedulesModelError.fromJson(Map<String, dynamic> json) =>
      _$SchedulesModelErrorFromJson(json);

  SchedulesModelError setType(SchedulesModelType type) => SchedulesModelError(
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
