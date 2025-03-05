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
}
