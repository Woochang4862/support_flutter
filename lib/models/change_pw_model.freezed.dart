// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_pw_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChangePWModel _$ChangePWModelFromJson(Map<String, dynamic> json) {
  return _ChangePwModel.fromJson(json);
}

/// @nodoc
mixin _$ChangePWModel {
  ChangePWModelType? get type => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String get statusMessage => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get responseTime => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  /// Serializes this ChangePWModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChangePWModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangePWModelCopyWith<ChangePWModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePWModelCopyWith<$Res> {
  factory $ChangePWModelCopyWith(
          ChangePWModel value, $Res Function(ChangePWModel) then) =
      _$ChangePWModelCopyWithImpl<$Res, ChangePWModel>;
  @useResult
  $Res call(
      {ChangePWModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      String? data});
}

/// @nodoc
class _$ChangePWModelCopyWithImpl<$Res, $Val extends ChangePWModel>
    implements $ChangePWModelCopyWith<$Res> {
  _$ChangePWModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangePWModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? statusCode = freezed,
    Object? statusMessage = null,
    Object? code = freezed,
    Object? responseTime = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChangePWModelType?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      responseTime: freezed == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePwModelImplCopyWith<$Res>
    implements $ChangePWModelCopyWith<$Res> {
  factory _$$ChangePwModelImplCopyWith(
          _$ChangePwModelImpl value, $Res Function(_$ChangePwModelImpl) then) =
      __$$ChangePwModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ChangePWModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      String? data});
}

/// @nodoc
class __$$ChangePwModelImplCopyWithImpl<$Res>
    extends _$ChangePWModelCopyWithImpl<$Res, _$ChangePwModelImpl>
    implements _$$ChangePwModelImplCopyWith<$Res> {
  __$$ChangePwModelImplCopyWithImpl(
      _$ChangePwModelImpl _value, $Res Function(_$ChangePwModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangePWModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? statusCode = freezed,
    Object? statusMessage = null,
    Object? code = freezed,
    Object? responseTime = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ChangePwModelImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChangePWModelType?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      responseTime: freezed == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePwModelImpl extends _ChangePwModel {
  _$ChangePwModelImpl(
      {this.type,
      this.statusCode,
      required this.statusMessage,
      this.code,
      this.responseTime,
      this.data})
      : super._();

  factory _$ChangePwModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangePwModelImplFromJson(json);

  @override
  final ChangePWModelType? type;
  @override
  final int? statusCode;
  @override
  final String statusMessage;
  @override
  final String? code;
  @override
  final String? responseTime;
  @override
  final String? data;

  @override
  String toString() {
    return 'ChangePWModel(type: $type, statusCode: $statusCode, statusMessage: $statusMessage, code: $code, responseTime: $responseTime, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePwModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, statusCode, statusMessage, code, responseTime, data);

  /// Create a copy of ChangePWModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePwModelImplCopyWith<_$ChangePwModelImpl> get copyWith =>
      __$$ChangePwModelImplCopyWithImpl<_$ChangePwModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePwModelImplToJson(
      this,
    );
  }
}

abstract class _ChangePwModel extends ChangePWModel {
  factory _ChangePwModel(
      {final ChangePWModelType? type,
      final int? statusCode,
      required final String statusMessage,
      final String? code,
      final String? responseTime,
      final String? data}) = _$ChangePwModelImpl;
  _ChangePwModel._() : super._();

  factory _ChangePwModel.fromJson(Map<String, dynamic> json) =
      _$ChangePwModelImpl.fromJson;

  @override
  ChangePWModelType? get type;
  @override
  int? get statusCode;
  @override
  String get statusMessage;
  @override
  String? get code;
  @override
  String? get responseTime;
  @override
  String? get data;

  /// Create a copy of ChangePWModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePwModelImplCopyWith<_$ChangePwModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChangePWModelError _$ChangePWModelErrorFromJson(Map<String, dynamic> json) {
  return _ChangePWModelError.fromJson(json);
}

/// @nodoc
mixin _$ChangePWModelError {
  ChangePWModelType? get type => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String get statusMessage => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get responseTime => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  /// Serializes this ChangePWModelError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChangePWModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangePWModelErrorCopyWith<ChangePWModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePWModelErrorCopyWith<$Res> {
  factory $ChangePWModelErrorCopyWith(
          ChangePWModelError value, $Res Function(ChangePWModelError) then) =
      _$ChangePWModelErrorCopyWithImpl<$Res, ChangePWModelError>;
  @useResult
  $Res call(
      {ChangePWModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      String? data});
}

/// @nodoc
class _$ChangePWModelErrorCopyWithImpl<$Res, $Val extends ChangePWModelError>
    implements $ChangePWModelErrorCopyWith<$Res> {
  _$ChangePWModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangePWModelError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? statusCode = freezed,
    Object? statusMessage = null,
    Object? code = freezed,
    Object? responseTime = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChangePWModelType?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      responseTime: freezed == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePWModelErrorImplCopyWith<$Res>
    implements $ChangePWModelErrorCopyWith<$Res> {
  factory _$$ChangePWModelErrorImplCopyWith(_$ChangePWModelErrorImpl value,
          $Res Function(_$ChangePWModelErrorImpl) then) =
      __$$ChangePWModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ChangePWModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      String? data});
}

/// @nodoc
class __$$ChangePWModelErrorImplCopyWithImpl<$Res>
    extends _$ChangePWModelErrorCopyWithImpl<$Res, _$ChangePWModelErrorImpl>
    implements _$$ChangePWModelErrorImplCopyWith<$Res> {
  __$$ChangePWModelErrorImplCopyWithImpl(_$ChangePWModelErrorImpl _value,
      $Res Function(_$ChangePWModelErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangePWModelError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? statusCode = freezed,
    Object? statusMessage = null,
    Object? code = freezed,
    Object? responseTime = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ChangePWModelErrorImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChangePWModelType?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      responseTime: freezed == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePWModelErrorImpl extends _ChangePWModelError {
  _$ChangePWModelErrorImpl(
      {this.type,
      this.statusCode,
      required this.statusMessage,
      this.code,
      this.responseTime,
      this.data})
      : super._();

  factory _$ChangePWModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangePWModelErrorImplFromJson(json);

  @override
  final ChangePWModelType? type;
  @override
  final int? statusCode;
  @override
  final String statusMessage;
  @override
  final String? code;
  @override
  final String? responseTime;
  @override
  final String? data;

  @override
  String toString() {
    return 'ChangePWModelError(type: $type, statusCode: $statusCode, statusMessage: $statusMessage, code: $code, responseTime: $responseTime, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePWModelErrorImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, statusCode, statusMessage, code, responseTime, data);

  /// Create a copy of ChangePWModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePWModelErrorImplCopyWith<_$ChangePWModelErrorImpl> get copyWith =>
      __$$ChangePWModelErrorImplCopyWithImpl<_$ChangePWModelErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePWModelErrorImplToJson(
      this,
    );
  }
}

abstract class _ChangePWModelError extends ChangePWModelError {
  factory _ChangePWModelError(
      {final ChangePWModelType? type,
      final int? statusCode,
      required final String statusMessage,
      final String? code,
      final String? responseTime,
      final String? data}) = _$ChangePWModelErrorImpl;
  _ChangePWModelError._() : super._();

  factory _ChangePWModelError.fromJson(Map<String, dynamic> json) =
      _$ChangePWModelErrorImpl.fromJson;

  @override
  ChangePWModelType? get type;
  @override
  int? get statusCode;
  @override
  String get statusMessage;
  @override
  String? get code;
  @override
  String? get responseTime;
  @override
  String? get data;

  /// Create a copy of ChangePWModelError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePWModelErrorImplCopyWith<_$ChangePWModelErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
