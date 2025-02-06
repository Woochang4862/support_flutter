// ignore_for_file: invalid_annotation_target

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:support_flutter/utils/icons/sign_up_icons_icons.dart';
part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

abstract class ProfileModelBase {}

enum ProfileModelType { fetch, update }

@freezed
class ProfileModel extends ProfileModelBase with _$ProfileModel {
  ProfileModel._();
  @JsonSerializable(explicitToJson: true)
  factory ProfileModel({
    ProfileModelType? type,
    int? statusCode,
    required String statusMessage,
    String? code,
    String? responseTime,
    Profile? data,
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

enum GenderType {
  MAN('남자', SignUpIcons.ic_male),
  WOMAN('여자', SignUpIcons.ic_female);

  const GenderType(this.korean, this.icon);
  final String korean;
  final IconData icon;

  factory GenderType.fromCode(String gender) {
    switch (gender) {
      case 'MAN':
        return GenderType.MAN;
      case 'WOMAN':
        return GenderType.WOMAN;
      default:
        throw Exception('Invalid gender: $gender');
    }
  }

  factory GenderType.fromKorean(String korean) {
    switch (korean) {
      case '남자':
        return GenderType.MAN;
      case '여자':
        return GenderType.WOMAN;
      default:
        throw Exception('Invalid gender: $korean');
    }
  }
}

enum DormType {
  GounA('고운학사 A동', SignUpIcons.ic_dorm, 4),
  GounB('고운학사 B동', SignUpIcons.ic_dorm, 4),
  GounC('고운학사 C동', SignUpIcons.ic_dorm, 4),
  Gyung11('글로벌 경상관 11층', SignUpIcons.ic_dorm, 3),
  Gyung12('글로벌 경상관 12층', SignUpIcons.ic_dorm, 3),
  Gyung13('글로벌 경상관 13층', SignUpIcons.ic_dorm, 3),
  Gyung14('글로벌 경상관 14층', SignUpIcons.ic_dorm, 3);

  const DormType(this.korean, this.icon, this.numberOfLaundry);
  final String korean;
  final IconData icon;
  final int numberOfLaundry;

  factory DormType.fromCode(String dorm) {
    switch (dorm) {
      case 'GounA':
        return DormType.GounA;
      case 'GounB':
        return DormType.GounB;
      case 'GounC':
        return DormType.GounC;
      case 'Gyung11':
        return DormType.Gyung11;
      case 'Gyung12':
        return DormType.Gyung12;
      case 'Gyung13':
        return DormType.Gyung13;
      case 'Gyung14':
        return DormType.Gyung14;
      default:
        throw Exception('Invalid dorm: $dorm');
    }
  }

  factory DormType.fromKorean(String korean) {
    switch (korean) {
      case '고운학사 A동':
        return DormType.GounA;
      case '고운학사 B동':
        return DormType.GounB;
      case '고운학사 C동':
        return DormType.GounC;
      case '글로벌 경상관 11층':
        return DormType.Gyung11;
      case '글로벌 경상관 12층':
        return DormType.Gyung12;
      case '글로벌 경상관 13층':
        return DormType.Gyung13;
      case '글로벌 경상관 14층':
        return DormType.Gyung14;
      default:
        throw Exception('Invalid dorm: $korean');
    }
  }
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
class ProfileModelError extends ProfileModelBase
    with _$ProfileModelError
    implements Error {
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
