import 'package:flutter_riverpod/flutter_riverpod.dart';
<<<<<<< HEAD
import 'package:support_flutter/models/schedule_detail_model.dart';
=======
>>>>>>> develop
import 'package:support_flutter/models/schedules_model.dart';
import 'package:support_flutter/repositories/schedules_repository.dart';

final scheduleDetailViewModelProvider = StateNotifierProvider.autoDispose
<<<<<<< HEAD
    .family<ScheduleDetailViewModel, AsyncValue<ScheduleDetailModel>, int>(
=======
    .family<ScheduleDetailViewModel, AsyncValue<SchedulesModel>, int>(
>>>>>>> develop
        (ref, scheduleId) {
  final schedulesRepository = ref.watch(schedulesRepositoryProvider);
  return ScheduleDetailViewModel(
      schedulesRepository: schedulesRepository, scheduleId: scheduleId);
});

class ScheduleDetailViewModel
<<<<<<< HEAD
    extends StateNotifier<AsyncValue<ScheduleDetailModel>> {
  final SchedulesRepository schedulesRepository;
  final int scheduleId;
=======
    extends StateNotifier<AsyncValue<SchedulesModel>> {
  final SchedulesRepository schedulesRepository;
  final scheduleId;
>>>>>>> develop
  ScheduleDetailViewModel({
    required this.schedulesRepository,
    required this.scheduleId,
  }) : super(const AsyncLoading()) {
    fetchSchedule(scheduleId: scheduleId);
  }

  Future<void> fetchSchedule({required int scheduleId}) async {
    try {
      state = const AsyncLoading();
      final response =
<<<<<<< HEAD
          await schedulesRepository.getSchedule(scheduleId: scheduleId);
=======
          await schedulesRepository.getSchedules(scheduleId: scheduleId);
>>>>>>> develop
      state = AsyncData(response);
    } on SchedulesModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = SchedulesModelError(statusMessage: '예외발생 : $e');
      state = AsyncError(error, error.stackTrace);
    }
  }
}
