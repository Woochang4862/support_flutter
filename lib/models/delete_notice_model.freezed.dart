// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_notice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteNoticeModel _$DeleteNoticeModelFromJson(Map<String, dynamic> json) {
  return _DeleteNoticeModel.fromJson(json);
}

/// @nodoc
mixin _$DeleteNoticeModel {
  DeleteNoticeModelType? get type => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String get statusMessage => throw _privateConstructorUsedError;
  String? get responseTime => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  /// Serializes this DeleteNoticeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteNoticeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteNoticeModelCopyWith<DeleteNoticeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteNoticeModelCopyWith<$Res> {
  factory $DeleteNoticeModelCopyWith(
          DeleteNoticeModel value, $Res Function(DeleteNoticeModel) then) =
      _$DeleteNoticeModelCopyWithImpl<$Res, DeleteNoticeModel>;
  @useResult
  $Res call(
      {DeleteNoticeModelType? type,
      int? statusCode,
      String statusMessage,
      String? responseTime,
      String? data,
      String? code});
}

/// @nodoc
class _$DeleteNoticeModelCopyWithImpl<$Res, $Val extends DeleteNoticeModel>
    implements $DeleteNoticeModelCopyWith<$Res> {
  _$DeleteNoticeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteNoticeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? statusCode = freezed,
    Object? statusMessage = null,
    Object? responseTime = freezed,
    Object? data = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeleteNoticeModelType?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      responseTime: freezed == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteNoticeModelImplCopyWith<$Res>
    implements $DeleteNoticeModelCopyWith<$Res> {
  factory _$$DeleteNoticeModelImplCopyWith(_$DeleteNoticeModelImpl value,
          $Res Function(_$DeleteNoticeModelImpl) then) =
      __$$DeleteNoticeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeleteNoticeModelType? type,
      int? statusCode,
      String statusMessage,
      String? responseTime,
      String? data,
      String? code});
}

/// @nodoc
class __$$DeleteNoticeModelImplCopyWithImpl<$Res>
    extends _$DeleteNoticeModelCopyWithImpl<$Res, _$DeleteNoticeModelImpl>
    implements _$$DeleteNoticeModelImplCopyWith<$Res> {
  __$$DeleteNoticeModelImplCopyWithImpl(_$DeleteNoticeModelImpl _value,
      $Res Function(_$DeleteNoticeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteNoticeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? statusCode = freezed,
    Object? statusMessage = null,
    Object? responseTime = freezed,
    Object? data = freezed,
    Object? code = freezed,
  }) {
    return _then(_$DeleteNoticeModelImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeleteNoticeModelType?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      responseTime: freezed == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteNoticeModelImpl extends _DeleteNoticeModel {
  _$DeleteNoticeModelImpl(
      {this.type,
      this.statusCode,
      required this.statusMessage,
      this.responseTime,
      this.data,
      this.code})
      : super._();

  factory _$DeleteNoticeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteNoticeModelImplFromJson(json);

  @override
  final DeleteNoticeModelType? type;
  @override
  final int? statusCode;
  @override
  final String statusMessage;
  @override
  final String? responseTime;
  @override
  final String? data;
  @override
  final String? code;

  @override
  String toString() {
    return 'DeleteNoticeModel(type: $type, statusCode: $statusCode, statusMessage: $statusMessage, responseTime: $responseTime, data: $data, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteNoticeModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, statusCode, statusMessage, responseTime, data, code);

  /// Create a copy of DeleteNoticeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteNoticeModelImplCopyWith<_$DeleteNoticeModelImpl> get copyWith =>
      __$$DeleteNoticeModelImplCopyWithImpl<_$DeleteNoticeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteNoticeModelImplToJson(
      this,
    );
  }
}

abstract class _DeleteNoticeModel extends DeleteNoticeModel {
  factory _DeleteNoticeModel(
      {final DeleteNoticeModelType? type,
      final int? statusCode,
      required final String statusMessage,
      final String? responseTime,
      final String? data,
      final String? code}) = _$DeleteNoticeModelImpl;
  _DeleteNoticeModel._() : super._();

  factory _DeleteNoticeModel.fromJson(Map<String, dynamic> json) =
      _$DeleteNoticeModelImpl.fromJson;

  @override
  DeleteNoticeModelType? get type;
  @override
  int? get statusCode;
  @override
  String get statusMessage;
  @override
  String? get responseTime;
  @override
  String? get data;
  @override
  String? get code;

  /// Create a copy of DeleteNoticeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteNoticeModelImplCopyWith<_$DeleteNoticeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeleteNoticeModelError _$DeleteNoticeModelErrorFromJson(
    Map<String, dynamic> json) {
  return _DeleteNoticeModelError.fromJson(json);
}

/// @nodoc
mixin _$DeleteNoticeModelError {
  DeleteNoticeModelType? get type => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String get statusMessage => throw _privateConstructorUsedError;
  String? get responseTime => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  /// Serializes this DeleteNoticeModelError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteNoticeModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteNoticeModelErrorCopyWith<DeleteNoticeModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteNoticeModelErrorCopyWith<$Res> {
  factory $DeleteNoticeModelErrorCopyWith(DeleteNoticeModelError value,
          $Res Function(DeleteNoticeModelError) then) =
      _$DeleteNoticeModelErrorCopyWithImpl<$Res, DeleteNoticeModelError>;
  @useResult
  $Res call(
      {DeleteNoticeModelType? type,
      int? statusCode,
      String statusMessage,
      String? responseTime,
      String? data,
      String? code});
}

/// @nodoc
class _$DeleteNoticeModelErrorCopyWithImpl<$Res,
        $Val extends DeleteNoticeModelError>
    implements $DeleteNoticeModelErrorCopyWith<$Res> {
  _$DeleteNoticeModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteNoticeModelError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? statusCode = freezed,
    Object? statusMessage = null,
    Object? responseTime = freezed,
    Object? data = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeleteNoticeModelType?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      responseTime: freezed == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteNoticeModelErrorImplCopyWith<$Res>
    implements $DeleteNoticeModelErrorCopyWith<$Res> {
  factory _$$DeleteNoticeModelErrorImplCopyWith(
          _$DeleteNoticeModelErrorImpl value,
          $Res Function(_$DeleteNoticeModelErrorImpl) then) =
      __$$DeleteNoticeModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeleteNoticeModelType? type,
      int? statusCode,
      String statusMessage,
      String? responseTime,
      String? data,
      String? code});
}

/// @nodoc
class __$$DeleteNoticeModelErrorImplCopyWithImpl<$Res>
    extends _$DeleteNoticeModelErrorCopyWithImpl<$Res,
        _$DeleteNoticeModelErrorImpl>
    implements _$$DeleteNoticeModelErrorImplCopyWith<$Res> {
  __$$DeleteNoticeModelErrorImplCopyWithImpl(
      _$DeleteNoticeModelErrorImpl _value,
      $Res Function(_$DeleteNoticeModelErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteNoticeModelError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? statusCode = freezed,
    Object? statusMessage = null,
    Object? responseTime = freezed,
    Object? data = freezed,
    Object? code = freezed,
  }) {
    return _then(_$DeleteNoticeModelErrorImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeleteNoticeModelType?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      responseTime: freezed == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteNoticeModelErrorImpl extends _DeleteNoticeModelError {
  _$DeleteNoticeModelErrorImpl(
      {this.type,
      this.statusCode,
      required this.statusMessage,
      this.responseTime,
      this.data,
      this.code})
      : super._();

  factory _$DeleteNoticeModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteNoticeModelErrorImplFromJson(json);

  @override
  final DeleteNoticeModelType? type;
  @override
  final int? statusCode;
  @override
  final String statusMessage;
  @override
  final String? responseTime;
  @override
  final String? data;
  @override
  final String? code;

  @override
  String toString() {
    return 'DeleteNoticeModelError(type: $type, statusCode: $statusCode, statusMessage: $statusMessage, responseTime: $responseTime, data: $data, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteNoticeModelErrorImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, statusCode, statusMessage, responseTime, data, code);

  /// Create a copy of DeleteNoticeModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteNoticeModelErrorImplCopyWith<_$DeleteNoticeModelErrorImpl>
      get copyWith => __$$DeleteNoticeModelErrorImplCopyWithImpl<
          _$DeleteNoticeModelErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteNoticeModelErrorImplToJson(
      this,
    );
  }
}

abstract class _DeleteNoticeModelError extends DeleteNoticeModelError {
  factory _DeleteNoticeModelError(
      {final DeleteNoticeModelType? type,
      final int? statusCode,
      required final String statusMessage,
      final String? responseTime,
      final String? data,
      final String? code}) = _$DeleteNoticeModelErrorImpl;
  _DeleteNoticeModelError._() : super._();

  factory _DeleteNoticeModelError.fromJson(Map<String, dynamic> json) =
      _$DeleteNoticeModelErrorImpl.fromJson;

  @override
  DeleteNoticeModelType? get type;
  @override
  int? get statusCode;
  @override
  String get statusMessage;
  @override
  String? get responseTime;
  @override
  String? get data;
  @override
  String? get code;

  /// Create a copy of DeleteNoticeModelError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteNoticeModelErrorImplCopyWith<_$DeleteNoticeModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
