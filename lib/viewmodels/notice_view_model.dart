import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/models/notice_model.dart';
import 'package:support_flutter/repositories/notice_repository.dart';
import 'package:support_flutter/utils/logging/logger.dart';

final noticeViewModelProvider =
    StateNotifierProvider.autoDispose<NoticeViewModel, AsyncValue<NoticeModel>>(
        (ref) {
  final noticeRepository =
      ref.read(noticeRepositoryProvider); // NoticeRepository 주입
  return NoticeViewModel(noticeRepository: noticeRepository);
});

class NoticeViewModel extends StateNotifier<AsyncValue<NoticeModel>> {
  final NoticeRepository noticeRepository;
  NoticeViewModel({
    required this.noticeRepository,
  }) : super(const AsyncLoading()) {
    fetchNotices();
  }

// 공지사항 조회
  Future<void> fetchNotices() async {
    try {
      state = const AsyncLoading();
      try {
        var response = await noticeRepository.getNotices();
        // 읽은 공지사항인지 확인
        var notices = await checkMarkAsRead(response.data);
        response = response.setData(notices);
        state = AsyncData(response);
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

  Future<List<Notice>?> checkMarkAsRead(List<Notice>? data) async {
    if (data == null) return null;
    var notices = await Future.wait(data.map((element) async {
      final markAsRead = await noticeRepository.getMarkAsRead();
      element = element.setIsRead(markAsRead.contains(element.id.toString()));
      return element;
    }).toList());
    logger.d('checkMarkAsRead - $notices');
    return notices;
  }

// 공지사항 작성
  Future<void> createNotice({
    required String title,
    required String content,
  }) async {
    try {
      state = const AsyncLoading();

      var response =
          await noticeRepository.createNotice(title: title, content: content);

      state = AsyncData(response);
    } on NoticeModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = NoticeModelError(
          statusMessage: '예외발생 : $e', type: NoticeModelType.fetch);
      state = AsyncError(error, error.stackTrace);
    }
  }

  // 공지사항 수정
  Future<void> updateNotice({
    required int noticeId,
    required String title,
    required String content,
  }) async {
    try {
      state = const AsyncLoading();
      final response = await noticeRepository.updateNotice(
          noticeId: noticeId, title: title, content: content);
      state = AsyncData(response);
    } on NoticeModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = NoticeModelError(
          statusMessage: '예외발생 : $e', type: NoticeModelType.fetch);
      state = AsyncError(error, error.stackTrace);
    }
  }

// 공지사항 삭제
  Future<void> deleteNotice({
    required int noticeId,
  }) async {
    try {
      state = const AsyncLoading();
      final response = await noticeRepository.deleteNotice(noticeId: noticeId);
      state = AsyncData(response);
    } on NoticeModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = NoticeModelError(
          statusMessage: '예외발생 : $e', type: NoticeModelType.fetch);
      state = AsyncError(error, error.stackTrace);
    }
  }
}
