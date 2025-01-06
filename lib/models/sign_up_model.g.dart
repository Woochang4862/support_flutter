// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpModelImpl _$$SignUpModelImplFromJson(Map<String, dynamic> json) =>
    _$SignUpModelImpl(
      type: $enumDecodeNullable(_$SignUpModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String,
      code: json['code'] as String?,
      responseTime: json['responseTime'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$SignUpModelImplToJson(_$SignUpModelImpl instance) =>
    <String, dynamic>{
      'type': _$SignUpModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'code': instance.code,
      'responseTime': instance.responseTime,
      'data': instance.data,
    };

const _$SignUpModelTypeEnumMap = {
  SignUpModelType.verifyId: 'verifyId',
  SignUpModelType.verifyCode: 'verifyCode',
  SignUpModelType.signUp: 'signUp',
};

_$SignUpModelErrorImpl _$$SignUpModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$SignUpModelErrorImpl(
      type: $enumDecodeNullable(_$SignUpModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String,
      code: json['code'] as String?,
      responseTime: json['responseTime'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$SignUpModelErrorImplToJson(
        _$SignUpModelErrorImpl instance) =>
    <String, dynamic>{
      'type': _$SignUpModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'code': instance.code,
      'responseTime': instance.responseTime,
      'data': instance.data,
    };
