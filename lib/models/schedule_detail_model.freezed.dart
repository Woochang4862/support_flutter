// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleDetailModel _$ScheduleDetailModelFromJson(Map<String, dynamic> json) {
  return _ScheduleDetailModel.fromJson(json);
}

/// @nodoc
mixin _$ScheduleDetailModel {
  @JsonKey(name: "statusCode")
  int get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: "statusMessage")
  String get statusMessage => throw _privateConstructorUsedError;
  @JsonKey(name: "responseTime")
  String get responseTime => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data get data => throw _privateConstructorUsedError;
  @JsonKey(name: "code")
  String get code => throw _privateConstructorUsedError;
  ScheduleDetailModelType? get type => throw _privateConstructorUsedError;

  /// Serializes this ScheduleDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleDetailModelCopyWith<ScheduleDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleDetailModelCopyWith<$Res> {
  factory $ScheduleDetailModelCopyWith(
          ScheduleDetailModel value, $Res Function(ScheduleDetailModel) then) =
      _$ScheduleDetailModelCopyWithImpl<$Res, ScheduleDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "statusCode") int statusCode,
      @JsonKey(name: "statusMessage") String statusMessage,
      @JsonKey(name: "responseTime") String responseTime,
      @JsonKey(name: "data") Data data,
      @JsonKey(name: "code") String code,
      ScheduleDetailModelType? type});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$ScheduleDetailModelCopyWithImpl<$Res, $Val extends ScheduleDetailModel>
    implements $ScheduleDetailModelCopyWith<$Res> {
  _$ScheduleDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? responseTime = null,
    Object? data = null,
    Object? code = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      responseTime: null == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScheduleDetailModelType?,
    ) as $Val);
  }

  /// Create a copy of ScheduleDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScheduleDetailModelImplCopyWith<$Res>
    implements $ScheduleDetailModelCopyWith<$Res> {
  factory _$$ScheduleDetailModelImplCopyWith(_$ScheduleDetailModelImpl value,
          $Res Function(_$ScheduleDetailModelImpl) then) =
      __$$ScheduleDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "statusCode") int statusCode,
      @JsonKey(name: "statusMessage") String statusMessage,
      @JsonKey(name: "responseTime") String responseTime,
      @JsonKey(name: "data") Data data,
      @JsonKey(name: "code") String code,
      ScheduleDetailModelType? type});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ScheduleDetailModelImplCopyWithImpl<$Res>
    extends _$ScheduleDetailModelCopyWithImpl<$Res, _$ScheduleDetailModelImpl>
    implements _$$ScheduleDetailModelImplCopyWith<$Res> {
  __$$ScheduleDetailModelImplCopyWithImpl(_$ScheduleDetailModelImpl _value,
      $Res Function(_$ScheduleDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduleDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? responseTime = null,
    Object? data = null,
    Object? code = null,
    Object? type = freezed,
  }) {
    return _then(_$ScheduleDetailModelImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      responseTime: null == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScheduleDetailModelType?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ScheduleDetailModelImpl extends _ScheduleDetailModel {
  _$ScheduleDetailModelImpl(
      {@JsonKey(name: "statusCode") required this.statusCode,
      @JsonKey(name: "statusMessage") required this.statusMessage,
      @JsonKey(name: "responseTime") required this.responseTime,
      @JsonKey(name: "data") required this.data,
      @JsonKey(name: "code") required this.code,
      this.type})
      : super._();

  factory _$ScheduleDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleDetailModelImplFromJson(json);

  @override
  @JsonKey(name: "statusCode")
  final int statusCode;
  @override
  @JsonKey(name: "statusMessage")
  final String statusMessage;
  @override
  @JsonKey(name: "responseTime")
  final String responseTime;
  @override
  @JsonKey(name: "data")
  final Data data;
  @override
  @JsonKey(name: "code")
  final String code;
  @override
  final ScheduleDetailModelType? type;

  @override
  String toString() {
    return 'ScheduleDetailModel(statusCode: $statusCode, statusMessage: $statusMessage, responseTime: $responseTime, data: $data, code: $code, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleDetailModelImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, statusCode, statusMessage, responseTime, data, code, type);

  /// Create a copy of ScheduleDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleDetailModelImplCopyWith<_$ScheduleDetailModelImpl> get copyWith =>
      __$$ScheduleDetailModelImplCopyWithImpl<_$ScheduleDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleDetailModelImplToJson(
      this,
    );
  }
}

abstract class _ScheduleDetailModel extends ScheduleDetailModel {
  factory _ScheduleDetailModel(
      {@JsonKey(name: "statusCode") required final int statusCode,
      @JsonKey(name: "statusMessage") required final String statusMessage,
      @JsonKey(name: "responseTime") required final String responseTime,
      @JsonKey(name: "data") required final Data data,
      @JsonKey(name: "code") required final String code,
      final ScheduleDetailModelType? type}) = _$ScheduleDetailModelImpl;
  _ScheduleDetailModel._() : super._();

  factory _ScheduleDetailModel.fromJson(Map<String, dynamic> json) =
      _$ScheduleDetailModelImpl.fromJson;

  @override
  @JsonKey(name: "statusCode")
  int get statusCode;
  @override
  @JsonKey(name: "statusMessage")
  String get statusMessage;
  @override
  @JsonKey(name: "responseTime")
  String get responseTime;
  @override
  @JsonKey(name: "data")
  Data get data;
  @override
  @JsonKey(name: "code")
  String get code;
  @override
  ScheduleDetailModelType? get type;

  /// Create a copy of ScheduleDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleDetailModelImplCopyWith<_$ScheduleDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "content")
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: "startDate")
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "endDate")
  String get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "color")
  int get color => throw _privateConstructorUsedError;

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "content") String content,
      @JsonKey(name: "startDate") String startDate,
      @JsonKey(name: "endDate") String endDate,
      @JsonKey(name: "color") int color});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Data
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
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "content") String content,
      @JsonKey(name: "startDate") String startDate,
      @JsonKey(name: "endDate") String endDate,
      @JsonKey(name: "color") int color});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  /// Create a copy of Data
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
    return _then(_$DataImpl(
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
class _$DataImpl implements _Data {
  _$DataImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "content") required this.content,
      @JsonKey(name: "startDate") required this.startDate,
      @JsonKey(name: "endDate") required this.endDate,
      @JsonKey(name: "color") required this.color});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "content")
  final String content;
  @override
  @JsonKey(name: "startDate")
  final String startDate;
  @override
  @JsonKey(name: "endDate")
  final String endDate;
  @override
  @JsonKey(name: "color")
  final int color;

  @override
  String toString() {
    return 'Data(id: $id, title: $title, content: $content, startDate: $startDate, endDate: $endDate, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
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

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  factory _Data(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "title") required final String title,
      @JsonKey(name: "content") required final String content,
      @JsonKey(name: "startDate") required final String startDate,
      @JsonKey(name: "endDate") required final String endDate,
      @JsonKey(name: "color") required final int color}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "content")
  String get content;
  @override
  @JsonKey(name: "startDate")
  String get startDate;
  @override
  @JsonKey(name: "endDate")
  String get endDate;
  @override
  @JsonKey(name: "color")
  int get color;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScheduleDetailModelError _$ScheduleDetailModelErrorFromJson(
    Map<String, dynamic> json) {
  return _ScheduleDetailModelError.fromJson(json);
}

/// @nodoc
mixin _$ScheduleDetailModelError {
  @JsonKey(name: "statusCode")
  int get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: "statusMessage")
  String get statusMessage => throw _privateConstructorUsedError;
  @JsonKey(name: "code")
  String get code => throw _privateConstructorUsedError;
  ScheduleDetailModelType? get type => throw _privateConstructorUsedError;

  /// Serializes this ScheduleDetailModelError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleDetailModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleDetailModelErrorCopyWith<ScheduleDetailModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleDetailModelErrorCopyWith<$Res> {
  factory $ScheduleDetailModelErrorCopyWith(ScheduleDetailModelError value,
          $Res Function(ScheduleDetailModelError) then) =
      _$ScheduleDetailModelErrorCopyWithImpl<$Res, ScheduleDetailModelError>;
  @useResult
  $Res call(
      {@JsonKey(name: "statusCode") int statusCode,
      @JsonKey(name: "statusMessage") String statusMessage,
      @JsonKey(name: "code") String code,
      ScheduleDetailModelType? type});
}

/// @nodoc
class _$ScheduleDetailModelErrorCopyWithImpl<$Res,
        $Val extends ScheduleDetailModelError>
    implements $ScheduleDetailModelErrorCopyWith<$Res> {
  _$ScheduleDetailModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleDetailModelError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? code = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScheduleDetailModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleDetailModelErrorImplCopyWith<$Res>
    implements $ScheduleDetailModelErrorCopyWith<$Res> {
  factory _$$ScheduleDetailModelErrorImplCopyWith(
          _$ScheduleDetailModelErrorImpl value,
          $Res Function(_$ScheduleDetailModelErrorImpl) then) =
      __$$ScheduleDetailModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "statusCode") int statusCode,
      @JsonKey(name: "statusMessage") String statusMessage,
      @JsonKey(name: "code") String code,
      ScheduleDetailModelType? type});
}

/// @nodoc
class __$$ScheduleDetailModelErrorImplCopyWithImpl<$Res>
    extends _$ScheduleDetailModelErrorCopyWithImpl<$Res,
        _$ScheduleDetailModelErrorImpl>
    implements _$$ScheduleDetailModelErrorImplCopyWith<$Res> {
  __$$ScheduleDetailModelErrorImplCopyWithImpl(
      _$ScheduleDetailModelErrorImpl _value,
      $Res Function(_$ScheduleDetailModelErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduleDetailModelError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? code = null,
    Object? type = freezed,
  }) {
    return _then(_$ScheduleDetailModelErrorImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScheduleDetailModelType?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ScheduleDetailModelErrorImpl extends _ScheduleDetailModelError {
  _$ScheduleDetailModelErrorImpl(
      {@JsonKey(name: "statusCode") required this.statusCode,
      @JsonKey(name: "statusMessage") required this.statusMessage,
      @JsonKey(name: "code") required this.code,
      this.type})
      : super._();

  factory _$ScheduleDetailModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleDetailModelErrorImplFromJson(json);

  @override
  @JsonKey(name: "statusCode")
  final int statusCode;
  @override
  @JsonKey(name: "statusMessage")
  final String statusMessage;
  @override
  @JsonKey(name: "code")
  final String code;
  @override
  final ScheduleDetailModelType? type;

  @override
  String toString() {
    return 'ScheduleDetailModelError(statusCode: $statusCode, statusMessage: $statusMessage, code: $code, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleDetailModelErrorImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, statusCode, statusMessage, code, type);

  /// Create a copy of ScheduleDetailModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleDetailModelErrorImplCopyWith<_$ScheduleDetailModelErrorImpl>
      get copyWith => __$$ScheduleDetailModelErrorImplCopyWithImpl<
          _$ScheduleDetailModelErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleDetailModelErrorImplToJson(
      this,
    );
  }
}

abstract class _ScheduleDetailModelError extends ScheduleDetailModelError {
  factory _ScheduleDetailModelError(
      {@JsonKey(name: "statusCode") required final int statusCode,
      @JsonKey(name: "statusMessage") required final String statusMessage,
      @JsonKey(name: "code") required final String code,
      final ScheduleDetailModelType? type}) = _$ScheduleDetailModelErrorImpl;
  _ScheduleDetailModelError._() : super._();

  factory _ScheduleDetailModelError.fromJson(Map<String, dynamic> json) =
      _$ScheduleDetailModelErrorImpl.fromJson;

  @override
  @JsonKey(name: "statusCode")
  int get statusCode;
  @override
  @JsonKey(name: "statusMessage")
  String get statusMessage;
  @override
  @JsonKey(name: "code")
  String get code;
  @override
  ScheduleDetailModelType? get type;

  /// Create a copy of ScheduleDetailModelError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleDetailModelErrorImplCopyWith<_$ScheduleDetailModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
