// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleDetailModelImpl _$$ScheduleDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ScheduleDetailModelImpl(
      statusCode: (json['statusCode'] as num).toInt(),
      statusMessage: json['statusMessage'] as String,
      responseTime: json['responseTime'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      code: json['code'] as String,
      type: $enumDecodeNullable(_$ScheduleDetailModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ScheduleDetailModelImplToJson(
        _$ScheduleDetailModelImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'responseTime': instance.responseTime,
      'data': instance.data.toJson(),
      'code': instance.code,
      'type': _$ScheduleDetailModelTypeEnumMap[instance.type],
    };

const _$ScheduleDetailModelTypeEnumMap = {
  ScheduleDetailModelType.fetch: 'fetch',
  ScheduleDetailModelType.update: 'update',
  ScheduleDetailModelType.delete: 'delete',
  ScheduleDetailModelType.create: 'create',
};

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      color: (json['color'] as num).toInt(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'color': instance.color,
    };

_$ScheduleDetailModelErrorImpl _$$ScheduleDetailModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$ScheduleDetailModelErrorImpl(
      statusCode: (json['statusCode'] as num).toInt(),
      statusMessage: json['statusMessage'] as String,
      code: json['code'] as String,
      type: $enumDecodeNullable(_$ScheduleDetailModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ScheduleDetailModelErrorImplToJson(
        _$ScheduleDetailModelErrorImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'code': instance.code,
      'type': _$ScheduleDetailModelTypeEnumMap[instance.type],
    };
