import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/dio/dio.dart';
import 'package:support_flutter/models/schedule_detail_model.dart';
import 'package:support_flutter/models/schedules_model.dart';
import 'package:support_flutter/utils/logging/logger.dart';

final schedulesRepositoryProvider = Provider<SchedulesRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return SchedulesRepository(
    baseUrl: '$protocol://$host:$port/schedule',
    dio: dio,
  );
});

class SchedulesRepository {
  final String baseUrl;
  final Dio dio;

  SchedulesRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<SchedulesModel> getMonthlySchedules({
    required String date,
  }) async {
    final response = await dio.get(
      '$baseUrl',
      queryParameters: {
        'date': date,
      },
    );

    logger.d(response.data);

    logger.d(
        'getMonthlySchedules - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return SchedulesModel.fromJson(response.data)
          .setType(SchedulesModelType.fetch);
    } else {
      throw SchedulesModelError.fromJson(response.data)
          .setType(SchedulesModelType.fetch);
    }
  }

  // 특정 스케줄 조회
  Future<ScheduleDetailModel> getSchedule({
    required int scheduleId,
  }) async {
    final response = await dio.get(
      '$baseUrl/${scheduleId}',
    );

    logger.d(response.data);

    logger.d(
        'getSchedules - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return ScheduleDetailModel.fromJson(response.data)
          .setType(ScheduleDetailModelType.fetch);
    } else {
      throw ScheduleDetailModelError.fromJson(response.data)
          .setType(ScheduleDetailModelType.fetch);
    }
  }

  Future<ScheduleDetailModel> updateSchedule({
    required int scheduleId,
    required String title,
    required String content,
    required String startDate,
    required String endDate,
    required int color,
  }) async {
    final response = await dio.put(
      '$baseUrl/$scheduleId',
      data: {
        'id': scheduleId,
        'title': title,
        'content': content,
        'startDate': startDate,
        'endDate': endDate,
        'color': color,
      },
      options: Options(
        headers: {
          'accessToken': true,
        },
      ),
    );

    logger.d(response.data);

    logger.d(
        'updateSchedule - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return ScheduleDetailModel.fromJson(response.data)
          .setType(ScheduleDetailModelType.update);
    } else {
      throw ScheduleDetailModelError.fromJson(response.data)
          .setType(ScheduleDetailModelType.update);
    }
  }

  Future<ScheduleDetailModel> createSchedule({
    required String title,
    required String content,
    required String startDate,
    required String endDate,
    required int color,
  }) async {
    final response = await dio.post(
      '$baseUrl/add',
      data: {
        'title': title,
        'content': content,
        'startDate': startDate,
        'endDate': endDate,
        'color': color,
      },
      options: Options(
        headers: {
          'accessToken': true,
        },
      ),
    );

    logger.d(response.data);

    logger.d(
        'createSchedule - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return ScheduleDetailModel.fromJson(response.data)
          .setType(ScheduleDetailModelType.create);
    } else {
      throw ScheduleDetailModelError.fromJson(response.data)
          .setType(ScheduleDetailModelType.create);
    }
  }

  Future<ScheduleDetailModel> deleteSchedule({required int scheduleId}) async {
    final response = await dio.delete(
      '$baseUrl/$scheduleId',
      options: Options(
        headers: {
          'accessToken': true,
        },
      ),
    );

    logger.d(response.data);

    logger.d(
        'deleteSchedule - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return ScheduleDetailModel.fromJson(response.data)
          .setType(ScheduleDetailModelType.delete);
    } else {
      throw ScheduleDetailModelError.fromJson(response.data)
          .setType(ScheduleDetailModelType.delete);
    }
  }
}
