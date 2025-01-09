import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/models/change_pw_model.dart';
import 'package:support_flutter/repositories/change_pw_repository.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/utils/regex/Regex.dart';
import 'package:support_flutter/viewmodels/user_view_model.dart';

final changePWViewModelProvider = StateNotifierProvider.autoDispose<
    ChangePwViewModel, AsyncValue<ChangePWModel?>>((ref) {
  final changePWRepository = ref.read(changePWRepositoryProvider);
  final userViewModel = ref.read(userViewModelProvider.notifier);
  return ChangePwViewModel(
      changePWRepository: changePWRepository, userViewModel: userViewModel);
});

class ChangePwViewModel extends StateNotifier<AsyncValue<ChangePWModel?>> {
  final ChangePWRepository changePWRepository;
  final UserViewModel userViewModel;

  ChangePwViewModel({
    required this.changePWRepository,
    required this.userViewModel,
  }) : super(AsyncData(null));

  Future<void> changePW({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirm,
  }) async {
    try {
      state = AsyncLoading();
      if (currentPassword.isEmpty) {
        throw ChangePWModelError(
          statusMessage: '현재 비밀번호가 비었습니다!',
          code: 'USR-F302',
          type: ChangePWModelType.changePW,
        );
      }
      logger.d(newPassword.validate());
      if (!newPassword.validate()) {
        throw ChangePWModelError(
          statusMessage: '비밀번호가 형식에 맞지 않습니다!',
          code: "USR-F300",
          type: ChangePWModelType.changePW,
        );
      }
      if (newPassword != newPasswordConfirm) {
        throw ChangePWModelError(
          code: "USR-F301",
          statusMessage: '비밀번호가 일치하지 않습니다!',
          type: ChangePWModelType.changePW,
        );
      }
      final response = await changePWRepository.changePW(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      await userViewModel.logout();
      state = AsyncData(response);
    } on ChangePWModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = ChangePWModelError(
          statusMessage: '예외발생 - $e', type: ChangePWModelType.changePW);
      state = AsyncError(error, error.stackTrace);
    }
  }
}
