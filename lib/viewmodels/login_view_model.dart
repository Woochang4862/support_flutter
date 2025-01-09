import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/models/user_model.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/viewmodels/user_view_model.dart';

final loginViewModelProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, AsyncValue<UserModel?>>(
        (ref) {
  final userViewModel = ref.watch(userViewModelProvider.notifier);

  return LoginViewModel(
    userViewModel: userViewModel,
  );
});

class LoginViewModel extends StateNotifier<AsyncValue<UserModel?>> {
  final UserViewModel userViewModel;
  LoginViewModel({
    required this.userViewModel,
  }) : super(AsyncData(null)); // Login Page 에 들어왔다는 것은 User 정보가 없다는 얘기

  Future<void> login({
    required String id,
    required String password,
  }) async {
    try {
      // 첫 state는 Loading 상태
      state = AsyncLoading();
      if (id.isEmpty || password.isEmpty) {
        throw UserModelError(
            statusMessage: '아이디 비밀번호가 입력되지 않았습니다.', code: "USR-F800");
      }

      final userResponse =
          await userViewModel.login(id: id, password: password);
      logger.d('LoginViewModel - 로그인 완료');

      state = AsyncData(userResponse);
    } on UserModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = UserModelError(statusMessage: '예외발생 : $e');
      state = AsyncError(error, error.stackTrace);
    }
  }

  Future<void> logout() async {
    await userViewModel.logout();
  }
}
