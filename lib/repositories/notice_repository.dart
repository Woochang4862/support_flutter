import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/dio/dio.dart';
import 'package:support_flutter/models/notice_model.dart';
import 'package:support_flutter/utils/logging/logger.dart';

final noticeRepositoryProvider = Provider<NoticeRepository>((ref) {
  final dio = ref.read(dioProvider);

  return NoticeRepository(
    baseUrl: '$protocol://$host:$port/notification',
    dio: dio,
  );
});

class NoticeRepository {
  final String baseUrl;
  final Dio dio;

  NoticeRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<NoticeModel> getNotices() async {
    final response = await dio.get(
      '$baseUrl',
    );

    logger.d(response.data);

    logger.d(
        'getNotices - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return NoticeModel.fromJson(response.data).setType(NoticeModelType.fetch);
    } else {
      throw NoticeModelError.fromJson(response.data)
          .setType(NoticeModelType.fetch);
    }
  }
}
