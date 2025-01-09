// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      type: $enumDecodeNullable(_$ProfileModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String,
      code: json['code'] as String?,
      responseTime: json['responseTime'] as String?,
      data: json['data'] == null
          ? null
          : Profile.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'type': _$ProfileModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'code': instance.code,
      'responseTime': instance.responseTime,
      'data': instance.data?.toJson(),
    };

const _$ProfileModelTypeEnumMap = {
  ProfileModelType.fetch: 'fetch',
  ProfileModelType.update: 'update',
};

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: (json['id'] as num).toInt(),
      loginId: json['loginId'] as String,
      nickname: json['nickname'] as String,
      gender: json['gender'] as String,
      dormType: json['dormType'] as String,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'loginId': instance.loginId,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'dormType': instance.dormType,
    };

_$ProfileModelErrorImpl _$$ProfileModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileModelErrorImpl(
      type: $enumDecodeNullable(_$ProfileModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String,
      code: json['code'] as String?,
      responseTime: json['responseTime'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$ProfileModelErrorImplToJson(
        _$ProfileModelErrorImpl instance) =>
    <String, dynamic>{
      'type': _$ProfileModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'code': instance.code,
      'responseTime': instance.responseTime,
      'data': instance.data,
    };
