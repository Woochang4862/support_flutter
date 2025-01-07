// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

enum ProfileModelType { fetch }

@freezed
class ProfileModel with _$ProfileModel {
  ProfileModel._();
  @JsonSerializable(explicitToJson: true)
  factory ProfileModel({
    ProfileModelType? type,
    int? statusCode,
    required String statusMessage,
    String? code,
    String? responseTime,
    required Profile data,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  ProfileModel setType(
    ProfileModelType? type,
  ) =>
      ProfileModel(
          statusMessage: statusMessage,
          type: type,
          statusCode: statusCode,
          code: code,
          responseTime: responseTime,
          data: data);
}

@freezed
class Profile with _$Profile {
  factory Profile({
    required int id,
    required String loginId,
    required String nickname,
    required String gender,
    required String dormType,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

@freezed
class ProfileModelError with _$ProfileModelError implements Error {
  ProfileModelError._();
  factory ProfileModelError({
    ProfileModelType? type,
    int? statusCode,
    required String statusMessage,
    String? code,
    String? responseTime,
    String? data,
  }) = _ProfileModelError;

  factory ProfileModelError.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelErrorFromJson(json);

  ProfileModelError setType(
    ProfileModelType? type,
  ) =>
      ProfileModelError(
          statusMessage: statusMessage,
          type: type,
          statusCode: statusCode,
          code: code,
          responseTime: responseTime,
          data: data);

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
