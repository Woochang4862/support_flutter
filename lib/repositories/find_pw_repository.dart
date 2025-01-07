import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/dio/dio.dart';
import 'package:support_flutter/models/find_pw_model.dart';
import 'package:support_flutter/utils/logging/logger.dart';

final findPWRepositoryProvider = Provider<FindPWRepository>((ref) {
  final dio = ref.read(dioProvider);

  return FindPWRepository(
    baseUrl: '$protocol://$host:$port/member/mail/find',
    dio: dio,
  );
});

class FindPWRepository {
  final String baseUrl;
  final Dio dio;

  FindPWRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<FindPWModel> findPW({
    required String id,
  }) async {
    final response = await dio.post(
      '$baseUrl',
      queryParameters: {
        'loginId': id,
      },
    );

    logger.d(response.data);

    logger.d('findPW - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return FindPWModel.fromJson(response.data)
          .setType(FindPWModelType.findPW);
    } else {
      // Bad Request
      throw FindPWModelError.fromJson(response.data)
          .setType(FindPWModelType.findPW);
    }
  }
}
