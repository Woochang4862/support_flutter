import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/single_child_scroll_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/dio/dio.dart';
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
  Future<SchedulesModel> getSchedules({
    required int scheduleId,
  }) async {
    final response = await dio.get(
      '$baseUrl/${scheduleId}',
    );

    logger.d(response.data);

    logger.d(
        'getSchedules - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return SchedulesModel.fromJson(response.data)
          .setType(SchedulesModelType.fetch);
    } else {
      throw SchedulesModelError.fromJson(response.data)
          .setType(SchedulesModelType.fetch);
    }
  }

  when(
      {required SingleChildScrollView Function(dynamic schedules) data,
      required Center Function() loading,
      required Center Function(dynamic error, dynamic stackTrace) error}) {}
}
