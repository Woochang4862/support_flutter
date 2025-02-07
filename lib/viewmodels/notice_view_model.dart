import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/models/notice_model.dart';
import 'package:support_flutter/repositories/notice_repository.dart';
import 'package:support_flutter/utils/logging/logger.dart';

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
      try {
        var response = await noticeRepository.getNotices();
        // 읽은 공지사항인지 확인
        var notices = await checkMarkAsRead(response.data);
        state = AsyncData(notices);
      } on NoticeModelError catch (e) {
        state = AsyncError(e, e.stackTrace);
      }
    } catch (e) {
      final error = NoticeModelError(
          statusMessage: '예외발생 : $e', type: NoticeModelType.fetch);
      state = AsyncError(error, error.stackTrace);
    }
  }

  Future<void> markAsRead(String id) async {
    try {
      await noticeRepository.markAsRead(id);
    } catch (e) {
      final error = NoticeModelError(
          statusMessage: '예외발생 : $e', type: NoticeModelType.fetch);
      state = AsyncError(error, error.stackTrace);
    }
  }

  Future<List<Notice>> checkMarkAsRead(List<Notice> data) async {
    var notices = await Future.wait(data.map((element) async {
      final markAsRead = await noticeRepository.getMarkAsRead();
      element = element.setIsRead(markAsRead.contains(element.id.toString()));
      return element;
    }).toList());
    logger.d('checkMarkAsRead - $notices');
    return notices;
  }
}
