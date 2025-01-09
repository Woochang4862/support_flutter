import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/dio/dio.dart';
import 'package:support_flutter/models/profile_model.dart';
import 'package:support_flutter/utils/logging/logger.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final dio = ref.read(dioProvider);
  return ProfileRepository(
    baseUrl: '$protocol://$host:$port/member/info',
    dio: dio,
  );
});

class ProfileRepository {
  final String baseUrl;
  final Dio dio;

  ProfileRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<ProfileModel> fetch() async {
    final response = await dio.get(
      '$baseUrl',
      options: Options(
        headers: {
          'accessToken': true,
        },
      ),
    );

    logger.d(response.data);

    logger.d(
        'fetchProfile - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(response.data)
          .setType(ProfileModelType.fetch);
    } else {
      // Bad Request
      throw ProfileModelError.fromJson(response.data)
          .setType(ProfileModelType.fetch);
    }
  }

  Future<ProfileModel> update({
    required String nickname,
    required String gender,
    required String dormType,
  }) async {
    final response = await dio.put(
      '$baseUrl',
      data: {
        'nickname': nickname,
        'gender': gender,
        'dormType': dormType,
      },
      options: Options(
        headers: {
          'accessToken': true,
        },
      ),
    );

    logger.d(response.data);

    logger.d(
        'fetchProfile - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(response.data)
          .setType(ProfileModelType.update);
    } else {
      // Bad Request
      throw ProfileModelError.fromJson(response.data)
          .setType(ProfileModelType.update);
    }
  }
}
