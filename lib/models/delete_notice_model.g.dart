// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeleteNoticeModelImpl _$$DeleteNoticeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteNoticeModelImpl(
      type: $enumDecodeNullable(_$DeleteNoticeModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String,
      responseTime: json['responseTime'] as String?,
      data: json['data'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$DeleteNoticeModelImplToJson(
        _$DeleteNoticeModelImpl instance) =>
    <String, dynamic>{
      'type': _$DeleteNoticeModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'responseTime': instance.responseTime,
      'data': instance.data,
      'code': instance.code,
    };

const _$DeleteNoticeModelTypeEnumMap = {
  DeleteNoticeModelType.delete: 'delete',
};

_$DeleteNoticeModelErrorImpl _$$DeleteNoticeModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteNoticeModelErrorImpl(
      type: $enumDecodeNullable(_$DeleteNoticeModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String,
      responseTime: json['responseTime'] as String?,
      data: json['data'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$DeleteNoticeModelErrorImplToJson(
        _$DeleteNoticeModelErrorImpl instance) =>
    <String, dynamic>{
      'type': _$DeleteNoticeModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'responseTime': instance.responseTime,
      'data': instance.data,
      'code': instance.code,
    };
