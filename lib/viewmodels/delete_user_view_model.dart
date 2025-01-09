import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/models/delete_user_model.dart';
import 'package:support_flutter/models/user_model.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/viewmodels/user_view_model.dart';

final deleteUserViewModelProvider = StateNotifierProvider.autoDispose<
    DeleteUserViewModel, AsyncValue<UserModel?>>((ref) {
  final userViewModel = ref.watch(userViewModelProvider.notifier);

  return DeleteUserViewModel(
    userViewModel: userViewModel,
  );
});

class DeleteUserViewModel extends StateNotifier<AsyncValue<DeleteUserModel?>> {
  final UserViewModel userViewModel;
  DeleteUserViewModel({
    required this.userViewModel,
  }) : super(AsyncData(null)); // DeleteUser Page 에 들어왔다는 것은 User 정보가 없다는 얘기

  Future<void> delete() async {
    try {
      // 첫 state는 Loading 상태
      state = AsyncLoading();

      final userResponse = await userViewModel.delete();
      logger.d('DeleteUserViewModel - 회원탈퇴 완료!');

      state = AsyncData(userResponse);
    } on DeleteUserModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = DeleteUserModelError(statusMessage: '예외발생 : $e');
      state = AsyncError(error, error.stackTrace);
    }
  }

  Future<void> logout() async {
    await userViewModel.logout();
  }
}
