import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/dio/dio.dart';
import 'package:support_flutter/models/change_pw_model.dart';
import 'package:support_flutter/utils/logging/logger.dart';

final changePWRepositoryProvider = Provider<ChangePWRepository>((ref) {
  final dio = ref.read(dioProvider);

  return ChangePWRepository(
    baseUrl: '$protocol://$host:$port/member/info/password',
    dio: dio,
  );
});

class ChangePWRepository {
  final String baseUrl;
  final Dio dio;

  ChangePWRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<ChangePWModel> changePW({
    required String currentPassword,
    required String newPassword,
  }) async {
    final response = await dio.put(
      '$baseUrl',
      data: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      },
      options: Options(
        headers: {
          'accessToken': true,
        },
      ),
    );

    logger.d(response.data);

    logger
        .d('changePW - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return ChangePWModel.fromJson(response.data)
          .setType(ChangePWModelType.changePW);
    } else {
      // Bad Request
      throw ChangePWModelError.fromJson(response.data)
          .setType(ChangePWModelType.changePW);
    }
  }
}
