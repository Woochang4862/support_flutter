import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/models/user_model.dart';
import 'package:support_flutter/repositories/login_repository.dart';

final authServiceProvider = Provider.autoDispose<AuthService>((ref) {
  final loginRepository = ref.read(loginRepositoryProvider);
  return AuthService(
    loginRepository: loginRepository,
  );
});

class AuthService {
  const AuthService({
    required this.loginRepository,
  });

  final LoginRepository loginRepository;

  Future<UserModel> login({
    required String id,
    required String password,
  }) async {
    try {
      return loginRepository.login(id: id, password: password);
    } on UserModelError catch (e) {
      rethrow;
    } catch (e) {
      throw UserModelError(message: '에외발생! - $e');
    }
  }
}
