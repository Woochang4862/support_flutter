import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/dio/dio.dart';
import 'package:support_flutter/models/delete_notice_model.dart';
import 'package:support_flutter/utils/logging/logger.dart';

final deleteNoticeRepositoryProvider = Provider<DeleteNoticeRepository>((ref) {
  final dio = ref.read(dioProvider);

  return DeleteNoticeRepository(
    baseUrl: '$protocol://$host:$port/notification',
    dio: dio,
  );
});

class DeleteNoticeRepository {
  final String baseUrl;
  final Dio dio;

  DeleteNoticeRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<DeleteNoticeModel> deleteNotice({
    required int noticeId,
  }) async {
    final response = await dio.delete(
      '$baseUrl/$noticeId',
      options: Options(
        headers: {
          'accessToken': true,
        },
      ),
    );

    logger.d(response.data);

    logger.d(
        'deleteNotice - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return DeleteNoticeModel.fromJson(response.data)
          .setType(DeleteNoticeModelType.delete);
    } else {
      // Bad Request
      throw DeleteNoticeModelError.fromJson(response.data)
          .setType(DeleteNoticeModelType.delete);
    }
  }
}
