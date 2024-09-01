import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/dio/dio.dart';
import 'package:support_flutter/models/user_model.dart';
import 'package:support_flutter/utils/logging/logger.dart';

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return LoginRepository(
    baseUrl: 'http://$host:$port/member',
    dio: dio,
  );
});

class LoginRepository {
  final String baseUrl;
  final Dio dio;

  LoginRepository({
    required this.baseUrl,
    required this.dio,
  });

  /////////// 로그인 관련 API ///////////
  Future<UserModel> login({
    required String id,
    required String password,
  }) async {
    final body = {
      'loginId': id,
      'password': password,
    };

    final response = await dio.post(
      '$baseUrl/login',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    logger.d(response.data);

    logger.d('login - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      // Bad Request
      throw UserModelError.fromJson(response.data);
    }
  }

  Future<void> logout({
    required String accessToken,
  }) async {
    final response = await dio.post(
      'http://$host:$port/integration/logout',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );

    logger.d(response.data);

    logger.d('logout - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return;
    } else {
      // Bad Request
      throw UserModelError.fromJson(response.data);
    }
  }
  ////////////////////////////////////
}