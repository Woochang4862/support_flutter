// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'find_pw_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FindPWModel _$FindPWModelFromJson(Map<String, dynamic> json) {
  return _FindPwModel.fromJson(json);
}

/// @nodoc
mixin _$FindPWModel {
  FindPWModelType? get type => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String get statusMessage => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get responseTime => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  /// Serializes this FindPWModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FindPWModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FindPWModelCopyWith<FindPWModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindPWModelCopyWith<$Res> {
  factory $FindPWModelCopyWith(
          FindPWModel value, $Res Function(FindPWModel) then) =
      _$FindPWModelCopyWithImpl<$Res, FindPWModel>;
  @useResult
  $Res call(
      {FindPWModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      String? data});
}

/// @nodoc
class _$FindPWModelCopyWithImpl<$Res, $Val extends FindPWModel>
    implements $FindPWModelCopyWith<$Res> {
  _$FindPWModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FindPWModel
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
              as FindPWModelType?,
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
abstract class _$$FindPwModelImplCopyWith<$Res>
    implements $FindPWModelCopyWith<$Res> {
  factory _$$FindPwModelImplCopyWith(
          _$FindPwModelImpl value, $Res Function(_$FindPwModelImpl) then) =
      __$$FindPwModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FindPWModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      String? data});
}

/// @nodoc
class __$$FindPwModelImplCopyWithImpl<$Res>
    extends _$FindPWModelCopyWithImpl<$Res, _$FindPwModelImpl>
    implements _$$FindPwModelImplCopyWith<$Res> {
  __$$FindPwModelImplCopyWithImpl(
      _$FindPwModelImpl _value, $Res Function(_$FindPwModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FindPWModel
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
    return _then(_$FindPwModelImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FindPWModelType?,
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
class _$FindPwModelImpl extends _FindPwModel {
  _$FindPwModelImpl(
      {this.type,
      this.statusCode,
      required this.statusMessage,
      this.code,
      this.responseTime,
      this.data})
      : super._();

  factory _$FindPwModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindPwModelImplFromJson(json);

  @override
  final FindPWModelType? type;
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
    return 'FindPWModel(type: $type, statusCode: $statusCode, statusMessage: $statusMessage, code: $code, responseTime: $responseTime, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindPwModelImpl &&
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

  /// Create a copy of FindPWModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FindPwModelImplCopyWith<_$FindPwModelImpl> get copyWith =>
      __$$FindPwModelImplCopyWithImpl<_$FindPwModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindPwModelImplToJson(
      this,
    );
  }
}

abstract class _FindPwModel extends FindPWModel {
  factory _FindPwModel(
      {final FindPWModelType? type,
      final int? statusCode,
      required final String statusMessage,
      final String? code,
      final String? responseTime,
      final String? data}) = _$FindPwModelImpl;
  _FindPwModel._() : super._();

  factory _FindPwModel.fromJson(Map<String, dynamic> json) =
      _$FindPwModelImpl.fromJson;

  @override
  FindPWModelType? get type;
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

  /// Create a copy of FindPWModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FindPwModelImplCopyWith<_$FindPwModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FindPWModelError _$FindPWModelErrorFromJson(Map<String, dynamic> json) {
  return _FindPWModelError.fromJson(json);
}

/// @nodoc
mixin _$FindPWModelError {
  FindPWModelType? get type => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String get statusMessage => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get responseTime => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  /// Serializes this FindPWModelError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FindPWModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FindPWModelErrorCopyWith<FindPWModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindPWModelErrorCopyWith<$Res> {
  factory $FindPWModelErrorCopyWith(
          FindPWModelError value, $Res Function(FindPWModelError) then) =
      _$FindPWModelErrorCopyWithImpl<$Res, FindPWModelError>;
  @useResult
  $Res call(
      {FindPWModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      String? data});
}

/// @nodoc
class _$FindPWModelErrorCopyWithImpl<$Res, $Val extends FindPWModelError>
    implements $FindPWModelErrorCopyWith<$Res> {
  _$FindPWModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FindPWModelError
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
              as FindPWModelType?,
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
abstract class _$$FindPWModelErrorImplCopyWith<$Res>
    implements $FindPWModelErrorCopyWith<$Res> {
  factory _$$FindPWModelErrorImplCopyWith(_$FindPWModelErrorImpl value,
          $Res Function(_$FindPWModelErrorImpl) then) =
      __$$FindPWModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FindPWModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      String? data});
}

/// @nodoc
class __$$FindPWModelErrorImplCopyWithImpl<$Res>
    extends _$FindPWModelErrorCopyWithImpl<$Res, _$FindPWModelErrorImpl>
    implements _$$FindPWModelErrorImplCopyWith<$Res> {
  __$$FindPWModelErrorImplCopyWithImpl(_$FindPWModelErrorImpl _value,
      $Res Function(_$FindPWModelErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of FindPWModelError
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
    return _then(_$FindPWModelErrorImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FindPWModelType?,
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
class _$FindPWModelErrorImpl extends _FindPWModelError {
  _$FindPWModelErrorImpl(
      {this.type,
      this.statusCode,
      required this.statusMessage,
      this.code,
      this.responseTime,
      this.data})
      : super._();

  factory _$FindPWModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindPWModelErrorImplFromJson(json);

  @override
  final FindPWModelType? type;
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
    return 'FindPWModelError(type: $type, statusCode: $statusCode, statusMessage: $statusMessage, code: $code, responseTime: $responseTime, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindPWModelErrorImpl &&
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

  /// Create a copy of FindPWModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FindPWModelErrorImplCopyWith<_$FindPWModelErrorImpl> get copyWith =>
      __$$FindPWModelErrorImplCopyWithImpl<_$FindPWModelErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindPWModelErrorImplToJson(
      this,
    );
  }
}

abstract class _FindPWModelError extends FindPWModelError {
  factory _FindPWModelError(
      {final FindPWModelType? type,
      final int? statusCode,
      required final String statusMessage,
      final String? code,
      final String? responseTime,
      final String? data}) = _$FindPWModelErrorImpl;
  _FindPWModelError._() : super._();

  factory _FindPWModelError.fromJson(Map<String, dynamic> json) =
      _$FindPWModelErrorImpl.fromJson;

  @override
  FindPWModelType? get type;
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

  /// Create a copy of FindPWModelError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FindPWModelErrorImplCopyWith<_$FindPWModelErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
