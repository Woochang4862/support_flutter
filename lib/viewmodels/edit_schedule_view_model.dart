import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/models/schedule_detail_model.dart';
import 'package:support_flutter/models/schedules_model.dart';
import 'package:support_flutter/repositories/schedules_repository.dart';

final editScheduleViewModelProvider = StateNotifierProvider.autoDispose<
    EditScheduleViewModel, AsyncValue<ScheduleDetailModel?>>((ref) {
  final schedulesRepository = ref.watch(schedulesRepositoryProvider);
  return EditScheduleViewModel(schedulesRepository: schedulesRepository);
});

class EditScheduleViewModel
    extends StateNotifier<AsyncValue<ScheduleDetailModel?>> {
  final SchedulesRepository schedulesRepository;
  int? scheduleId;
  EditScheduleViewModel({
    required this.schedulesRepository,
  }) : super(const AsyncData(null));

  Future<void> updateSchedule({
    required int scheduleId,
    required String title,
    required String content,
    required String startDate,
    required String endDate,
    required int color,
  }) async {
    try {
      state = const AsyncLoading();
      final response = await schedulesRepository.updateSchedule(
          scheduleId: scheduleId,
          title: title,
          content: content,
          startDate: startDate,
          endDate: endDate,
          color: color);
      state = AsyncData(response);
    } on SchedulesModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = SchedulesModelError(
          statusMessage: '예외발생 : $e', type: SchedulesModelType.update);
      state = AsyncError(error, error.stackTrace);
    }
  }

  Future<void> createSchedule({
    required String title,
    required String content,
    required String startDate,
    required String endDate,
    required int color,
  }) async {
    try {
      state = const AsyncLoading();
      final response = await schedulesRepository.createSchedule(
          title: title,
          content: content,
          startDate: startDate,
          endDate: endDate,
          color: color);
      state = AsyncData(response);
    } on SchedulesModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = SchedulesModelError(
          statusMessage: '예외발생 : $e', type: SchedulesModelType.create);
      state = AsyncError(error, error.stackTrace);
    }
  }

  void setScheduleId(int scheduleId) {
    this.scheduleId = scheduleId;
  }

  Future<void> deleteSchedule({required int scheduleId}) async {
    try {
      state = const AsyncLoading();
      await schedulesRepository.deleteSchedule(scheduleId: scheduleId);
      state = const AsyncData(null);
    } on SchedulesModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = SchedulesModelError(
          statusMessage: '예외발생 : $e', type: SchedulesModelType.delete);
      state = AsyncError(error, error.stackTrace);
    }
  }
}
