import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/dio/dio.dart';
import 'package:support_flutter/models/notice_model.dart';
import 'package:support_flutter/secure_storage/secure_storage.dart';
import 'package:support_flutter/utils/logging/logger.dart';

final noticeRepositoryProvider = Provider<NoticeRepository>((ref) {
  final dio = ref.read(dioProvider);
  final secureStorage = ref.read(secureStorageProvider);

  return NoticeRepository(
    baseUrl: '$protocol://$host:$port/notification',
    dio: dio,
    secureStorage: secureStorage,
  );
});

class NoticeRepository {
  final String baseUrl;
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  NoticeRepository({
    required this.baseUrl,
    required this.dio,
    required this.secureStorage,
  });

  // 공지사항 조회
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

  Future<void> markAsRead(String id) async {
    final markAsRead = await secureStorage.read(key: markAsReadKey) ?? "";
    final markAsReadList = markAsRead.split(',');
    if (markAsReadList.contains(id)) {
      return;
    }
    await secureStorage.write(key: markAsReadKey, value: '$markAsRead,$id');
  }

  Future<List<String>> getMarkAsRead() async {
    final markAsRead = await secureStorage.read(key: markAsReadKey);
    final markAsReadList = markAsRead?.split(',') ?? [];
    return markAsReadList;
  }

  // 공지사항 작성
  Future<NoticeModel> createNotice({
    required String title,
    required String content,
  }) async {
    final body = {
      "title": title,
      "content": content,
    };
    final response = await dio.post(
      '$baseUrl/add',
      data: body,
      options: Options(headers: {
        'accessToken': true,
      }),
    );

    logger.d(response.data);

    logger.d(
        'createNotice - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return NoticeModel.fromJson(response.data)
          .setType(NoticeModelType.create);
    } else {
      // 4xx
      throw NoticeModelError.fromJson(response.data)
          .setType(NoticeModelType.fetch);
    }
  }

  // 공지사항 수정
  Future<NoticeModel> updateNotice({
    required int noticeId,
    required String title,
    required String content,
  }) async {
    final body = {
      "title": title,
      "content": content,
    };
    final response = await dio.put(
      '$baseUrl/${noticeId}',
      data: body,
      options: Options(headers: {
        'accessToken': true,
      }),
    );

    logger.d(response.data);

    logger.d(
        'updateNotice - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return NoticeModel.fromJson(response.data)
          .setType(NoticeModelType.update);
    } else {
      // Bad Request
      throw NoticeModelError.fromJson(response.data)
          .setType(NoticeModelType.update);
    }
  }

  // 공지사항 삭제
  Future<NoticeModel> deleteNotice({
    required int noticeId,
  }) async {
    final response = await dio.delete(
      '$baseUrl/${noticeId}',
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
      return NoticeModel.fromJson(response.data)
          .setType(NoticeModelType.delete);
    } else {
      // Bad Request
      throw NoticeModelError.fromJson(response.data)
          .setType(NoticeModelType.delete);
    }
  }
}
