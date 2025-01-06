import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:support_flutter/models/schedules_model.dart';
import 'package:support_flutter/repositories/schedules_repository.dart';

final schedulesViewModelProvider = StateNotifierProviderFamily<
    SchedulesViewModel, AsyncValue<Map<String, List<Schedule>>?>, String>(
  (ref, date) {
    final schedulesRepository = ref.watch(schedulesRepositoryProvider);
    return SchedulesViewModel(
        schedulesRepository: schedulesRepository, date: date);
  },
);

class SchedulesViewModel
    extends StateNotifier<AsyncValue<Map<String, List<Schedule>>?>> {
  SchedulesViewModel({
    required this.schedulesRepository,
    required this.date,
  }) : super(AsyncLoading()) {
    fetchSchedules();
  }

  final SchedulesRepository schedulesRepository;
  final String date;

  Future<void> fetchSchedules() async {
    try {
      state = AsyncLoading();
      final response =
          await schedulesRepository.getMonthlySchedules(date: date);
      state = AsyncData(response.data?.groupSchedulesByDate);
    } on SchedulesModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = SchedulesModelError(
          statusMessage: '예외발생 : $e', type: SchedulesModelType.fetch);
      state = AsyncError(error, error.stackTrace);
    }
  }
}

extension on List<Schedule> {
  Map<String, List<Schedule>> get groupSchedulesByDate {
    Map<String, List<Schedule>> scheduleByDate = {};

    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    for (var schedule in this) {
      DateTime startDate = dateFormat.parse(schedule.startDate);
      DateTime endDate = dateFormat.parse(schedule.endDate);

      for (DateTime date = startDate;
          date.isBefore(endDate.add(Duration(days: 1)));
          date = date.add(Duration(days: 1))) {
        String dateString = dateFormat.format(date);
        if (!scheduleByDate.containsKey(dateString)) {
          scheduleByDate[dateString] = [];
        }
        scheduleByDate[dateString]!.add(schedule);
      }
    }
    return scheduleByDate;
  }
}
