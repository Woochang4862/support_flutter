import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/models/profile_model.dart';
import 'package:support_flutter/models/user_model.dart';
import 'package:support_flutter/repositories/login_repository.dart';
import 'package:support_flutter/repositories/profile_repository.dart';
import 'package:support_flutter/secure_storage/secure_storage.dart';
import 'package:support_flutter/utils/logging/logger.dart';
import 'package:support_flutter/viewmodels/profile_view_model.dart';

final userViewModelProvider =
    StateNotifierProvider<UserViewModel, AsyncValue<UserModel?>>((ref) {
  final loginRepository = ref.read(loginRepositoryProvider);
  final profileRepository = ref.read(profileRepositoryProvider);
  //final userMeRepository = ref.read(userMeRepositoryProvider);

  final storage = ref.read(secureStorageProvider);

  return UserViewModel(
    loginRepository: loginRepository,
    //userMeRepository: userMeRepository,
    profileRepository: profileRepository,
    storage: storage,
  );
});

class UserViewModel extends StateNotifier<AsyncValue<UserModel?>> {
  final LoginRepository loginRepository;
  //final UserMeRepository userMeRepository;
  final ProfileRepository profileRepository;
  final FlutterSecureStorage storage;

  UserViewModel({
    required this.loginRepository,
    //required this.userMeRepository,
    required this.profileRepository,
    required this.storage,
  }) : super(AsyncData(null)) {
    getMe();
  }

  Future<void> getMe() async {
    try {
      final profile = await profileRepository.fetch();
      logger.d('로그인 정보 확인 성공! : $profile');

      final accessToken = await storage.read(key: accessTokenKey);
      final role = await storage.read(key: roleKey);
      final refreshToken = await storage.read(key: refreshTokenKey);
      state = AsyncValue.data(
        UserModel(
          data: LoginData(
            accessToken: accessToken!,
            refreshToken: refreshToken!,
            role: role,
          ),
          statusMessage: '자동 로그인됨',
        ),
      );
    } catch (e) {
      logger.e('로그인 정보 확인 실패! : $e');
      state = AsyncData(null);
    }
  }

  Future<UserModel> login({
    required String id,
    required String password,
  }) async {
    try {
      final response = await loginRepository.login(
        id: id,
        password: password,
      );
      logger.d('UserViewModel - 로그인 완료! $response');

      Map<String, dynamic> payload =
          JwtDecoder.decode(response.data.accessToken);

      logger.d('login - payload : $payload');

      // secure storage에 Token 보관
      await storage.write(
          key: accessTokenKey, value: response.data.accessToken);
      await storage.write(
          key: refreshTokenKey, value: response.data.refreshToken);
      await storage.write(key: roleKey, value: payload['auth']);

      // 디버깅용 확인 코드
      final accessToken = await storage.read(key: accessTokenKey);
      final refreshToken = await storage.read(key: refreshTokenKey);
      final role = await storage.read(key: roleKey);
      logger.d(
          'UserViewModel - AccessToken : $accessToken / RefreshToken : $refreshToken / Role : $role 저장 성공!');
      state = AsyncValue.data(response.setRole(role)); // UserModel

      return response;
    } on UserModelError catch (e) {
      // 단순로그인 실패 및 예상 범위 밖 에러(네트워크 에러 ...)
      logger.d(e);
      rethrow;
    } catch (e) {
      logger.e('예외발생 - $e');
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      // 로그아웃 시 User 상태를 null로 초기화
      state = AsyncValue.data(null);

      String? _accessToken = await storage.read(key: accessTokenKey);
      // Secure Storage에서 Access Token과 Refresh Token, clubIds 삭제
      await Future.wait([
        storage.delete(key: accessTokenKey),
        storage.delete(key: refreshTokenKey),
        storage.delete(key: roleKey),
      ]);

      final accessToken = await storage.read(key: accessTokenKey);
      final refreshToken = await storage.read(key: refreshTokenKey);
      final role = await storage.read(key: roleKey);

      logger.d(
          'UserViewModel - AccessToken : $accessToken / RefreshToken : $refreshToken / Role : $role 삭제 성공!');

      await loginRepository.logout(accessToken: _accessToken ?? "");
    } on UserModelError catch (e) {
      logger.d(e);
      rethrow;
    } catch (e) {
      logger.e('예외발생 - $e');
      rethrow;
    }
  }

  // Future<ChangePwModel> changePW({
  //   required String userPw,
  //   required String newPw,
  //   required String confirmNewPw,
  // }) async {
  //   try {
  //     final response = await authRepository.changePW(
  //       userPw: userPw,
  //       newPw: newPw,
  //       confirmNewPw: confirmNewPw,
  //     );
  //     // 비밀번호 변경되는 경우
  //     // 1. 사용자가 직접 비밀번호 변경
  //     // 2. 비밀번호 찾기를 통한 비밀번호 변경
  //     // -->> 두 경우 모두 다시 로그인하는 과정 필요!
  //     await logout();
  //     return response;
  //   } on ChangePwModelError catch (e) {
  //     // 단순로그인 실패 및 예상 범위 밖 에러(네트워크 에러 ...)
  //     logger.d(e);
  //     rethrow;
  //   } catch (e) {
  //     logger.e('예외발생 - $e');
  //     rethrow;
  //   }
  // }

  // Future<ChangePwModel> resetPW({
  //   required String newPw,
  //   required String confirmNewPw,
  //   required String uuid,
  // }) async {
  //   try {
  //     final response = await authRepository.resetPW(
  //       password: newPw,
  //       confirmPassword: confirmNewPw,
  //       uuid: uuid,
  //     );
  //     return response;
  //   } on ChangePwModelError catch (e) {
  //     // 예외처리 안 실패
  //     logger.d(e);
  //     rethrow;
  //   } catch (e) {
  //     // 예외처리 밖 에러(네트워크 에러 ...)
  //     logger.e('예외발생 - $e');
  //     rethrow;
  //   }
  // }
}

class AutoLoginException implements Exception {
  final String message;
  AutoLoginException({required this.message});

  @override
  String toString() {
    return 'AutoLoginException(message:$message)';
  }
}
