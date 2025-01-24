import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/models/notice_model.dart';
import 'package:support_flutter/repositories/notice_repository.dart';

final noticeViewModelProvider = StateNotifierProvider.autoDispose<
    NoticeViewModel, AsyncValue<List<Notice>>>((ref) {
  final noticeRepository =
      ref.read(noticeRepositoryProvider); // NoticeRepository 주입
  return NoticeViewModel(noticeRepository: noticeRepository);
});

class NoticeViewModel extends StateNotifier<AsyncValue<List<Notice>>> {
  final NoticeRepository noticeRepository;
  NoticeViewModel({
    required this.noticeRepository,
  }) : super(AsyncLoading()) {
    fetchNotices();
  }

  Future<void> fetchNotices() async {
    try {
      state = AsyncLoading();
      final response = await noticeRepository.getNotices();
      state = AsyncData(response.data);
    } on NoticeModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = NoticeModelError(
          statusMessage: '예외발생 : $e', type: NoticeModelType.fetch);
      state = AsyncError(error, error.stackTrace);
    }
  }
}
