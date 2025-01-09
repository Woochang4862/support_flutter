// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeleteUserModelImpl _$$DeleteUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteUserModelImpl(
      type: $enumDecodeNullable(_$DeleteUserModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String,
      code: json['code'] as String?,
      responseTime: json['responseTime'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$DeleteUserModelImplToJson(
        _$DeleteUserModelImpl instance) =>
    <String, dynamic>{
      'type': _$DeleteUserModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'code': instance.code,
      'responseTime': instance.responseTime,
      'data': instance.data,
    };

const _$DeleteUserModelTypeEnumMap = {
  DeleteUserModelType.delete: 'delete',
};

_$DeleteUserModelErrorImpl _$$DeleteUserModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteUserModelErrorImpl(
      type: $enumDecodeNullable(_$DeleteUserModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String,
      code: json['code'] as String?,
      responseTime: json['responseTime'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$DeleteUserModelErrorImplToJson(
        _$DeleteUserModelErrorImpl instance) =>
    <String, dynamic>{
      'type': _$DeleteUserModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'code': instance.code,
      'responseTime': instance.responseTime,
      'data': instance.data,
    };
