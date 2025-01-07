// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_pw_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FindPwModelImpl _$$FindPwModelImplFromJson(Map<String, dynamic> json) =>
    _$FindPwModelImpl(
      type: $enumDecodeNullable(_$FindPWModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String,
      code: json['code'] as String?,
      responseTime: json['responseTime'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$FindPwModelImplToJson(_$FindPwModelImpl instance) =>
    <String, dynamic>{
      'type': _$FindPWModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'code': instance.code,
      'responseTime': instance.responseTime,
      'data': instance.data,
    };

const _$FindPWModelTypeEnumMap = {
  FindPWModelType.findPW: 'findPW',
};

_$FindPWModelErrorImpl _$$FindPWModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$FindPWModelErrorImpl(
      type: $enumDecodeNullable(_$FindPWModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String,
      code: json['code'] as String?,
      responseTime: json['responseTime'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$FindPWModelErrorImplToJson(
        _$FindPWModelErrorImpl instance) =>
    <String, dynamic>{
      'type': _$FindPWModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'code': instance.code,
      'responseTime': instance.responseTime,
      'data': instance.data,
    };
