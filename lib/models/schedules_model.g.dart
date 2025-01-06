// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedules_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SchedulesModelImpl _$$SchedulesModelImplFromJson(Map<String, dynamic> json) =>
    _$SchedulesModelImpl(
      type: $enumDecodeNullable(_$SchedulesModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String,
      code: json['code'] as String?,
      responseTime: json['responseTime'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SchedulesModelImplToJson(
        _$SchedulesModelImpl instance) =>
    <String, dynamic>{
      'type': _$SchedulesModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'code': instance.code,
      'responseTime': instance.responseTime,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

const _$SchedulesModelTypeEnumMap = {
  SchedulesModelType.fetch: 'fetch',
  SchedulesModelType.create: 'create',
  SchedulesModelType.update: 'update',
  SchedulesModelType.delete: 'delete',
};

_$ScheduleImpl _$$ScheduleImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      color: (json['color'] as num).toInt(),
    );

Map<String, dynamic> _$$ScheduleImplToJson(_$ScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'color': instance.color,
    };

_$SchedulesModelErrorImpl _$$SchedulesModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$SchedulesModelErrorImpl(
      type: $enumDecodeNullable(_$SchedulesModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String,
      code: json['code'] as String?,
      responseTime: json['responseTime'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$SchedulesModelErrorImplToJson(
        _$SchedulesModelErrorImpl instance) =>
    <String, dynamic>{
      'type': _$SchedulesModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'code': instance.code,
      'responseTime': instance.responseTime,
      'data': instance.data,
    };
