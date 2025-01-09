import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/models/find_pw_model.dart';
import 'package:support_flutter/repositories/find_pw_repository.dart';

final findPWViewModelProvider = StateNotifierProvider.autoDispose<
    FindPwViewModel, AsyncValue<FindPWModel?>>((ref) {
  final findPWRepository = ref.read(findPWRepositoryProvider);
  return FindPwViewModel(findPWRepository: findPWRepository);
});

class FindPwViewModel extends StateNotifier<AsyncValue<FindPWModel?>> {
  final FindPWRepository findPWRepository;

  FindPwViewModel({
    required this.findPWRepository,
  }) : super(AsyncData(null));

  Future<void> findPW({
    required String id,
  }) async {
    try {
      state = AsyncLoading();
      if (id.isEmpty) {
        throw FindPWModelError(
          statusMessage: '학교 이메일이 비었습니다!',
          code: 'USR-F100',
          type: FindPWModelType.findPW,
        );
      }
      final response = await findPWRepository.findPW(id: id);
      state = AsyncData(response);
    } on FindPWModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = FindPWModelError(
          statusMessage: '예외발생 - $e', type: FindPWModelType.findPW);
      state = AsyncError(error, error.stackTrace);
    }
  }
}
