import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/models/delete_notice_model.dart';
import 'package:support_flutter/repositories/delete_notice_repository.dart'; // 추가

final deleteNoticeViewModelProvider = StateNotifierProvider.autoDispose<
    DeleteNoticeViewModel, AsyncValue<DeleteNoticeModel?>>((ref) {
  final deleteNoticeRepository = ref.read(deleteNoticeRepositoryProvider); // 수정
  return DeleteNoticeViewModel(deleteNoticeRepository: deleteNoticeRepository);
});

class DeleteNoticeViewModel
    extends StateNotifier<AsyncValue<DeleteNoticeModel?>> {
  final DeleteNoticeRepository deleteNoticeRepository; // 수정

  DeleteNoticeViewModel({
    required this.deleteNoticeRepository,
  }) : super(AsyncData(null));

  Future<void> deleteNotice({
    required int noticeId,
  }) async {
    try {
      state = AsyncLoading();
      final response =
          await deleteNoticeRepository.deleteNotice(noticeId: noticeId);
      state = AsyncData(response);
    } on DeleteNoticeModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = DeleteNoticeModelError(statusMessage: '예외발생 : $e');
      state = AsyncError(error, error.stackTrace);
    }
  }
}
