import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/models/sign_up_model.dart';
import 'package:support_flutter/repositories/sign_up_repository.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/utils/regex/Regex.dart';

final signUpViewModelProvider = StateNotifierProvider.autoDispose<
    SignUpViewModel, AsyncValue<SignUpModel?>>((ref) {
  final SignUpRepository signUpRepository = ref.read(signUpRepositoryProvider);
  return SignUpViewModel(signUpRepository: signUpRepository);
});

class SignUpViewModel extends StateNotifier<AsyncValue<SignUpModel?>> {
  final SignUpRepository signUpRepository;

  SignUpViewModel({
    required this.signUpRepository,
  }) : super(AsyncData(null));

  Future<void> verifyId({required String id}) async {
    try {
      state = AsyncLoading();
      if (id.isEmpty) {
        throw SignUpModelError(
          statusMessage: '학교 이메일을 입력해주세요!',
          code: "USR-F100",
          type: SignUpModelType.verifyId,
        );
      }
      final response = await signUpRepository.verifyId(id: id);
      state = AsyncData(response);
    } on SignUpModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = SignUpModelError(
          statusMessage: '예외발생 - $e', type: SignUpModelType.verifyId);
      state = AsyncError(error, error.stackTrace);
    }
  }

  Future<void> verifyCode({
    required String id,
    required String code,
  }) async {
    try {
      state = AsyncLoading();
      if (code.isEmpty) {
        throw SignUpModelError(
          statusMessage: '인증번호를 입력해주세요!',
          code: "USR-F200",
          type: SignUpModelType.verifyCode,
        );
      }
      final response = await signUpRepository.verifyCode(
        id: id,
        code: code,
      );
      state = AsyncData(response);
    } on SignUpModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = SignUpModelError(
          statusMessage: '예외발생 - $e', type: SignUpModelType.verifyCode);
      state = AsyncError(error, error.stackTrace);
    }
  }

  Future<void> signUp({
    required String id,
    required String password,
    required String passwordConfirm,
    required String nickname,
    required String gender,
    required String dormType,
  }) async {
    try {
      state = AsyncLoading();
      logger.d(password.validate());
      if (!password.validate()) {
        throw SignUpModelError(
          statusMessage: '비밀번호가 형식에 맞지 않습니다!',
          code: "USR-F300",
          type: SignUpModelType.signUp,
        );
      }
      if (password != passwordConfirm) {
        throw SignUpModelError(
          code: "USR-F301",
          statusMessage: '비밀번호가 일치하지 않습니다!',
          type: SignUpModelType.signUp,
        );
      }
      final response = await signUpRepository.signUp(
        id: id,
        password: password,
        nickname: nickname,
        gender: koreanToSymbolMap[gender]!,
        dormType: dormTypeToSymbolMap[dormType]!,
      );
      state = AsyncData(response);
    } on SignUpModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
      return;
    } catch (e) {
      final error = SignUpModelError(
          statusMessage: '예외발생 - $e', type: SignUpModelType.signUp);
      state = AsyncError(error, error.stackTrace);
    }
  }
}

final symbolToKoreanMap = {
  'MAN': '남성',
  'WOMAN': '여성',
};

final koreanToSymbolMap = {
  '남성': 'MAN',
  '여성': 'WOMAN',
};

final dormTypeToSymbolMap = {
  '고운학사 A동': 'GounA',
  '고운학사 B동': 'GounB',
  '고운학사 C동': 'GounC',
  '글로벌 경상관 11층': 'GyungM',
  '글로벌 경상관 12층': 'GyungM',
  '글로벌 경상관 13층': 'GyungW',
  '글로벌 경상관 14층': 'GyungW',
};

final symbolToDormTypeMap = {
  'GounA': '고운학사 A동',
  'GounB': '고운학사 B동',
  'GounC': '고운학사 C동',
  'GyungM': '글로벌 경상관 11층',
  // 'GyungM': '글로벌 경상관 12층',
  'GyungW': '글로벌 경상관 13층',
  // 'GyungW': '글로벌 경상관 14층',
};
