import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/dio/dio.dart';
import 'package:support_flutter/models/sign_up_model.dart';
import 'package:support_flutter/utils/logging/logger.dart';

final signUpRepositoryProvider = Provider<SignUpRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return SignUpRepository(
    baseUrl: '$protocol://$host:$port/member',
    dio: dio,
  );
});

class SignUpRepository {
  final String baseUrl;
  final Dio dio;

  SignUpRepository({
    required this.baseUrl,
    required this.dio,
  });

  /////////// 회원가입 관련 API ///////////
  Future<SignUpModel> verifyId({
    required String id,
  }) async {
    final response = await dio.post(
      '$baseUrl/mail',
      data: {
        'loginId': id,
      },
    );

    logger.d(response.data);

    logger
        .d('verifyId - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return SignUpModel.fromJson(response.data)
          .setType(SignUpModelType.verifyId);
    } else {
      // Bad Request
      throw SignUpModelError.fromJson(response.data)
          .setType(SignUpModelType.verifyId);
    }
  }

  Future<SignUpModel> verifyCode({
    required String id,
    required String code,
  }) async {
    final body = {
      'loginId': id,
      'authCode': code,
    };
    final response = await dio.post(
      '$baseUrl/mailcheck',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    logger.d(response.data);

    logger.d(
        'verifyCode - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return SignUpModel.fromJson(response.data)
          .setType(SignUpModelType.verifyCode);
    } else {
      throw SignUpModelError.fromJson(response.data)
          .setType(SignUpModelType.verifyCode);
    }
  }

  Future<SignUpModel> signUp({
    required String id,
    required String password,
    required String nickname,
    required String gender,
    required String dormType,
  }) async {
    final body = {
      'loginId': id,
      'password': password,
      'nickname': nickname,
      'gender': gender,
      'dormType': dormType,
    };
    final response = await dio.post(
      '$baseUrl/signup',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    logger.d(response.data);

    logger.d('signUp - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return SignUpModel.fromJson(response.data)
          .setType(SignUpModelType.signUp);
    } else {
      // Bad Request
      throw SignUpModelError.fromJson(response.data)
          .setType(SignUpModelType.signUp);
    }
  }
  ////////////////////////////////////
}
