// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeModelImpl _$$NoticeModelImplFromJson(Map<String, dynamic> json) =>
    _$NoticeModelImpl(
      type: $enumDecodeNullable(_$NoticeModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String?,
      responseTime: json['responseTime'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => Notice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NoticeModelImplToJson(_$NoticeModelImpl instance) =>
    <String, dynamic>{
      'type': _$NoticeModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'responseTime': instance.responseTime,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

const _$NoticeModelTypeEnumMap = {
  NoticeModelType.fetch: 'fetch',
  NoticeModelType.create: 'create',
  NoticeModelType.update: 'update',
  NoticeModelType.delete: 'delete',
};

_$NoticeImpl _$$NoticeImplFromJson(Map<String, dynamic> json) => _$NoticeImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      creationDate: json['creationDate'] as String,
      content: json['content'] as String,
      isRead: json['isRead'] as bool?,
    );

Map<String, dynamic> _$$NoticeImplToJson(_$NoticeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'creationDate': instance.creationDate,
      'content': instance.content,
      'isRead': instance.isRead,
    };

_$NoticeModelErrorImpl _$$NoticeModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$NoticeModelErrorImpl(
      type: $enumDecodeNullable(_$NoticeModelTypeEnumMap, json['type']),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String?,
      responseTime: json['responseTime'] as String?,
      data: json['data'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$NoticeModelErrorImplToJson(
        _$NoticeModelErrorImpl instance) =>
    <String, dynamic>{
      'type': _$NoticeModelTypeEnumMap[instance.type],
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'responseTime': instance.responseTime,
      'data': instance.data,
      'code': instance.code,
    };
