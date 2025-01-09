// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteUserModel _$DeleteUserModelFromJson(Map<String, dynamic> json) {
  return _DeleteUserModel.fromJson(json);
}

/// @nodoc
mixin _$DeleteUserModel {
  DeleteUserModelType? get type => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String get statusMessage => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get responseTime => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  /// Serializes this DeleteUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteUserModelCopyWith<DeleteUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteUserModelCopyWith<$Res> {
  factory $DeleteUserModelCopyWith(
          DeleteUserModel value, $Res Function(DeleteUserModel) then) =
      _$DeleteUserModelCopyWithImpl<$Res, DeleteUserModel>;
  @useResult
  $Res call(
      {DeleteUserModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      String? data});
}

/// @nodoc
class _$DeleteUserModelCopyWithImpl<$Res, $Val extends DeleteUserModel>
    implements $DeleteUserModelCopyWith<$Res> {
  _$DeleteUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteUserModel
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
              as DeleteUserModelType?,
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
abstract class _$$DeleteUserModelImplCopyWith<$Res>
    implements $DeleteUserModelCopyWith<$Res> {
  factory _$$DeleteUserModelImplCopyWith(_$DeleteUserModelImpl value,
          $Res Function(_$DeleteUserModelImpl) then) =
      __$$DeleteUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeleteUserModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      String? data});
}

/// @nodoc
class __$$DeleteUserModelImplCopyWithImpl<$Res>
    extends _$DeleteUserModelCopyWithImpl<$Res, _$DeleteUserModelImpl>
    implements _$$DeleteUserModelImplCopyWith<$Res> {
  __$$DeleteUserModelImplCopyWithImpl(
      _$DeleteUserModelImpl _value, $Res Function(_$DeleteUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteUserModel
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
    return _then(_$DeleteUserModelImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeleteUserModelType?,
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
class _$DeleteUserModelImpl extends _DeleteUserModel {
  _$DeleteUserModelImpl(
      {this.type,
      this.statusCode,
      required this.statusMessage,
      this.code,
      this.responseTime,
      this.data})
      : super._();

  factory _$DeleteUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteUserModelImplFromJson(json);

  @override
  final DeleteUserModelType? type;
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
    return 'DeleteUserModel(type: $type, statusCode: $statusCode, statusMessage: $statusMessage, code: $code, responseTime: $responseTime, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteUserModelImpl &&
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

  /// Create a copy of DeleteUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteUserModelImplCopyWith<_$DeleteUserModelImpl> get copyWith =>
      __$$DeleteUserModelImplCopyWithImpl<_$DeleteUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteUserModelImplToJson(
      this,
    );
  }
}

abstract class _DeleteUserModel extends DeleteUserModel {
  factory _DeleteUserModel(
      {final DeleteUserModelType? type,
      final int? statusCode,
      required final String statusMessage,
      final String? code,
      final String? responseTime,
      final String? data}) = _$DeleteUserModelImpl;
  _DeleteUserModel._() : super._();

  factory _DeleteUserModel.fromJson(Map<String, dynamic> json) =
      _$DeleteUserModelImpl.fromJson;

  @override
  DeleteUserModelType? get type;
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

  /// Create a copy of DeleteUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteUserModelImplCopyWith<_$DeleteUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeleteUserModelError _$DeleteUserModelErrorFromJson(Map<String, dynamic> json) {
  return _DeleteUserModelError.fromJson(json);
}

/// @nodoc
mixin _$DeleteUserModelError {
  DeleteUserModelType? get type => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String get statusMessage => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get responseTime => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  /// Serializes this DeleteUserModelError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteUserModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteUserModelErrorCopyWith<DeleteUserModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteUserModelErrorCopyWith<$Res> {
  factory $DeleteUserModelErrorCopyWith(DeleteUserModelError value,
          $Res Function(DeleteUserModelError) then) =
      _$DeleteUserModelErrorCopyWithImpl<$Res, DeleteUserModelError>;
  @useResult
  $Res call(
      {DeleteUserModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      String? data});
}

/// @nodoc
class _$DeleteUserModelErrorCopyWithImpl<$Res,
        $Val extends DeleteUserModelError>
    implements $DeleteUserModelErrorCopyWith<$Res> {
  _$DeleteUserModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteUserModelError
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
              as DeleteUserModelType?,
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
abstract class _$$DeleteUserModelErrorImplCopyWith<$Res>
    implements $DeleteUserModelErrorCopyWith<$Res> {
  factory _$$DeleteUserModelErrorImplCopyWith(_$DeleteUserModelErrorImpl value,
          $Res Function(_$DeleteUserModelErrorImpl) then) =
      __$$DeleteUserModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeleteUserModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      String? data});
}

/// @nodoc
class __$$DeleteUserModelErrorImplCopyWithImpl<$Res>
    extends _$DeleteUserModelErrorCopyWithImpl<$Res, _$DeleteUserModelErrorImpl>
    implements _$$DeleteUserModelErrorImplCopyWith<$Res> {
  __$$DeleteUserModelErrorImplCopyWithImpl(_$DeleteUserModelErrorImpl _value,
      $Res Function(_$DeleteUserModelErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteUserModelError
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
    return _then(_$DeleteUserModelErrorImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeleteUserModelType?,
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
class _$DeleteUserModelErrorImpl extends _DeleteUserModelError {
  _$DeleteUserModelErrorImpl(
      {this.type,
      this.statusCode,
      required this.statusMessage,
      this.code,
      this.responseTime,
      this.data})
      : super._();

  factory _$DeleteUserModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteUserModelErrorImplFromJson(json);

  @override
  final DeleteUserModelType? type;
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
    return 'DeleteUserModelError(type: $type, statusCode: $statusCode, statusMessage: $statusMessage, code: $code, responseTime: $responseTime, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteUserModelErrorImpl &&
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

  /// Create a copy of DeleteUserModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteUserModelErrorImplCopyWith<_$DeleteUserModelErrorImpl>
      get copyWith =>
          __$$DeleteUserModelErrorImplCopyWithImpl<_$DeleteUserModelErrorImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteUserModelErrorImplToJson(
      this,
    );
  }
}

abstract class _DeleteUserModelError extends DeleteUserModelError {
  factory _DeleteUserModelError(
      {final DeleteUserModelType? type,
      final int? statusCode,
      required final String statusMessage,
      final String? code,
      final String? responseTime,
      final String? data}) = _$DeleteUserModelErrorImpl;
  _DeleteUserModelError._() : super._();

  factory _DeleteUserModelError.fromJson(Map<String, dynamic> json) =
      _$DeleteUserModelErrorImpl.fromJson;

  @override
  DeleteUserModelType? get type;
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

  /// Create a copy of DeleteUserModelError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteUserModelErrorImplCopyWith<_$DeleteUserModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
