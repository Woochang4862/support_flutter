// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedules_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SchedulesModel _$SchedulesModelFromJson(Map<String, dynamic> json) {
  return _SchedulesModel.fromJson(json);
}

/// @nodoc
mixin _$SchedulesModel {
  SchedulesModelType? get type => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String get statusMessage => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get responseTime => throw _privateConstructorUsedError;
  List<Schedule>? get data => throw _privateConstructorUsedError;

  /// Serializes this SchedulesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SchedulesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SchedulesModelCopyWith<SchedulesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchedulesModelCopyWith<$Res> {
  factory $SchedulesModelCopyWith(
          SchedulesModel value, $Res Function(SchedulesModel) then) =
      _$SchedulesModelCopyWithImpl<$Res, SchedulesModel>;
  @useResult
  $Res call(
      {SchedulesModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      List<Schedule>? data});
}

/// @nodoc
class _$SchedulesModelCopyWithImpl<$Res, $Val extends SchedulesModel>
    implements $SchedulesModelCopyWith<$Res> {
  _$SchedulesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SchedulesModel
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
              as SchedulesModelType?,
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
              as List<Schedule>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SchedulesModelImplCopyWith<$Res>
    implements $SchedulesModelCopyWith<$Res> {
  factory _$$SchedulesModelImplCopyWith(_$SchedulesModelImpl value,
          $Res Function(_$SchedulesModelImpl) then) =
      __$$SchedulesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SchedulesModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      List<Schedule>? data});
}

/// @nodoc
class __$$SchedulesModelImplCopyWithImpl<$Res>
    extends _$SchedulesModelCopyWithImpl<$Res, _$SchedulesModelImpl>
    implements _$$SchedulesModelImplCopyWith<$Res> {
  __$$SchedulesModelImplCopyWithImpl(
      _$SchedulesModelImpl _value, $Res Function(_$SchedulesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SchedulesModel
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
    return _then(_$SchedulesModelImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SchedulesModelType?,
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
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Schedule>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SchedulesModelImpl extends _SchedulesModel {
  _$SchedulesModelImpl(
      {this.type,
      this.statusCode,
      required this.statusMessage,
      this.code,
      this.responseTime,
      final List<Schedule>? data})
      : _data = data,
        super._();

  factory _$SchedulesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SchedulesModelImplFromJson(json);

  @override
  final SchedulesModelType? type;
  @override
  final int? statusCode;
  @override
  final String statusMessage;
  @override
  final String? code;
  @override
  final String? responseTime;
  final List<Schedule>? _data;
  @override
  List<Schedule>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SchedulesModel(type: $type, statusCode: $statusCode, statusMessage: $statusMessage, code: $code, responseTime: $responseTime, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchedulesModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, statusCode, statusMessage,
      code, responseTime, const DeepCollectionEquality().hash(_data));

  /// Create a copy of SchedulesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SchedulesModelImplCopyWith<_$SchedulesModelImpl> get copyWith =>
      __$$SchedulesModelImplCopyWithImpl<_$SchedulesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SchedulesModelImplToJson(
      this,
    );
  }
}

abstract class _SchedulesModel extends SchedulesModel {
  factory _SchedulesModel(
      {final SchedulesModelType? type,
      final int? statusCode,
      required final String statusMessage,
      final String? code,
      final String? responseTime,
      final List<Schedule>? data}) = _$SchedulesModelImpl;
  _SchedulesModel._() : super._();

  factory _SchedulesModel.fromJson(Map<String, dynamic> json) =
      _$SchedulesModelImpl.fromJson;

  @override
  SchedulesModelType? get type;
  @override
  int? get statusCode;
  @override
  String get statusMessage;
  @override
  String? get code;
  @override
  String? get responseTime;
  @override
  List<Schedule>? get data;

  /// Create a copy of SchedulesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SchedulesModelImplCopyWith<_$SchedulesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;

  /// Serializes this Schedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      String startDate,
      String endDate,
      int color});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleImplCopyWith<$Res>
    implements $ScheduleCopyWith<$Res> {
  factory _$$ScheduleImplCopyWith(
          _$ScheduleImpl value, $Res Function(_$ScheduleImpl) then) =
      __$$ScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      String startDate,
      String endDate,
      int color});
}

/// @nodoc
class __$$ScheduleImplCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$ScheduleImpl>
    implements _$$ScheduleImplCopyWith<$Res> {
  __$$ScheduleImplCopyWithImpl(
      _$ScheduleImpl _value, $Res Function(_$ScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? color = null,
  }) {
    return _then(_$ScheduleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleImpl implements _Schedule {
  _$ScheduleImpl(
      {required this.id,
      required this.title,
      required this.content,
      required this.startDate,
      required this.endDate,
      required this.color});

  factory _$ScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String startDate;
  @override
  final String endDate;
  @override
  final int color;

  @override
  String toString() {
    return 'Schedule(id: $id, title: $title, content: $content, startDate: $startDate, endDate: $endDate, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, content, startDate, endDate, color);

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      __$$ScheduleImplCopyWithImpl<_$ScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleImplToJson(
      this,
    );
  }
}

abstract class _Schedule implements Schedule {
  factory _Schedule(
      {required final int id,
      required final String title,
      required final String content,
      required final String startDate,
      required final String endDate,
      required final int color}) = _$ScheduleImpl;

  factory _Schedule.fromJson(Map<String, dynamic> json) =
      _$ScheduleImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  int get color;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SchedulesModelError _$SchedulesModelErrorFromJson(Map<String, dynamic> json) {
  return _SchedulesModelError.fromJson(json);
}

/// @nodoc
mixin _$SchedulesModelError {
  SchedulesModelType? get type => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String get statusMessage => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get responseTime => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  /// Serializes this SchedulesModelError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SchedulesModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SchedulesModelErrorCopyWith<SchedulesModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchedulesModelErrorCopyWith<$Res> {
  factory $SchedulesModelErrorCopyWith(
          SchedulesModelError value, $Res Function(SchedulesModelError) then) =
      _$SchedulesModelErrorCopyWithImpl<$Res, SchedulesModelError>;
  @useResult
  $Res call(
      {SchedulesModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      String? data});
}

/// @nodoc
class _$SchedulesModelErrorCopyWithImpl<$Res, $Val extends SchedulesModelError>
    implements $SchedulesModelErrorCopyWith<$Res> {
  _$SchedulesModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SchedulesModelError
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
              as SchedulesModelType?,
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
abstract class _$$SchedulesModelErrorImplCopyWith<$Res>
    implements $SchedulesModelErrorCopyWith<$Res> {
  factory _$$SchedulesModelErrorImplCopyWith(_$SchedulesModelErrorImpl value,
          $Res Function(_$SchedulesModelErrorImpl) then) =
      __$$SchedulesModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SchedulesModelType? type,
      int? statusCode,
      String statusMessage,
      String? code,
      String? responseTime,
      String? data});
}

/// @nodoc
class __$$SchedulesModelErrorImplCopyWithImpl<$Res>
    extends _$SchedulesModelErrorCopyWithImpl<$Res, _$SchedulesModelErrorImpl>
    implements _$$SchedulesModelErrorImplCopyWith<$Res> {
  __$$SchedulesModelErrorImplCopyWithImpl(_$SchedulesModelErrorImpl _value,
      $Res Function(_$SchedulesModelErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SchedulesModelError
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
    return _then(_$SchedulesModelErrorImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SchedulesModelType?,
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
class _$SchedulesModelErrorImpl extends _SchedulesModelError {
  _$SchedulesModelErrorImpl(
      {this.type,
      this.statusCode,
      required this.statusMessage,
      this.code,
      this.responseTime,
      this.data})
      : super._();

  factory _$SchedulesModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$SchedulesModelErrorImplFromJson(json);

  @override
  final SchedulesModelType? type;
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
    return 'SchedulesModelError(type: $type, statusCode: $statusCode, statusMessage: $statusMessage, code: $code, responseTime: $responseTime, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchedulesModelErrorImpl &&
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

  /// Create a copy of SchedulesModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SchedulesModelErrorImplCopyWith<_$SchedulesModelErrorImpl> get copyWith =>
      __$$SchedulesModelErrorImplCopyWithImpl<_$SchedulesModelErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SchedulesModelErrorImplToJson(
      this,
    );
  }
}

abstract class _SchedulesModelError extends SchedulesModelError {
  factory _SchedulesModelError(
      {final SchedulesModelType? type,
      final int? statusCode,
      required final String statusMessage,
      final String? code,
      final String? responseTime,
      final String? data}) = _$SchedulesModelErrorImpl;
  _SchedulesModelError._() : super._();

  factory _SchedulesModelError.fromJson(Map<String, dynamic> json) =
      _$SchedulesModelErrorImpl.fromJson;

  @override
  SchedulesModelType? get type;
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

  /// Create a copy of SchedulesModelError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SchedulesModelErrorImplCopyWith<_$SchedulesModelErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
