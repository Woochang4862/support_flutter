// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_pw_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChangePwModelImpl _$$ChangePwModelImplFromJson(Map<String, dynamic> json) =>
    _$ChangePwModelImpl(
      type: $enumDecodeNullable(_$ChangePWModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String,
      code: json['code'] as String?,
      responseTime: json['responseTime'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$ChangePwModelImplToJson(_$ChangePwModelImpl instance) =>
    <String, dynamic>{
      'type': _$ChangePWModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'code': instance.code,
      'responseTime': instance.responseTime,
      'data': instance.data,
    };

const _$ChangePWModelTypeEnumMap = {
  ChangePWModelType.changePW: 'changePW',
};

_$ChangePWModelErrorImpl _$$ChangePWModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$ChangePWModelErrorImpl(
      type: $enumDecodeNullable(_$ChangePWModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String,
      code: json['code'] as String?,
      responseTime: json['responseTime'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$ChangePWModelErrorImplToJson(
        _$ChangePWModelErrorImpl instance) =>
    <String, dynamic>{
      'type': _$ChangePWModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'code': instance.code,
      'responseTime': instance.responseTime,
      'data': instance.data,
    };
