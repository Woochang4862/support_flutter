import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/models/user_model.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/viewmodels/user_view_model.dart';

final loginViewModelProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, UserModelBase?>((ref) {
  final userViewModel = ref.watch(userViewModelProvider.notifier);

  return LoginViewModel(
    userViewModel: userViewModel,
  );
});

class LoginViewModel extends StateNotifier<UserModelBase?> {
  final UserViewModel userViewModel;
  LoginViewModel({
    required this.userViewModel,
  }) : super(
            userViewModel.state.value); // Login Page 에 들어왔다는 것은 User 정보가 없다는 얘기

  Future<UserModelBase> login({
    required String id,
    required String password,
  }) async {
    try {
      if (id.isEmpty || password.isEmpty) {
        throw UserModelError(message: '아이디 비밀번호가 입력되지 않았습니다.', code: "USR-F800");
      }
      // 첫 state는 Loading 상태
      state = UserModelLoading();

      final userResponse =
          await userViewModel.login(id: id, password: password);
      logger.d('LoginViewModel - 로그인 완료');

      state = userResponse;

      return userResponse;
    } catch (e) {
      if (e is UserModelError) {
        state = e;
      } else {
        state = UserModelError(message: '예외발생 : $e');
      }

      // 반환되는 값은 `UserModelError`임
      return Future.value(state);
    }
  }

  Future<void> logout() async {
    await userViewModel.logout();
  }
}