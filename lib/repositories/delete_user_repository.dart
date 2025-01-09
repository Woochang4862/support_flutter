import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/const/data.dart';
import 'package:support_flutter/dio/dio.dart';
import 'package:support_flutter/models/delete_user_model.dart';
import 'package:support_flutter/utils/logging/logger.dart';

final deleteUserRepositoryProvider = Provider<DeleteUserRepository>((ref) {
  final dio = ref.read(dioProvider);

  return DeleteUserRepository(
    baseUrl: '$protocol://$host:$port/member/delete',
    dio: dio,
  );
});

class DeleteUserRepository {
  final String baseUrl;
  final Dio dio;

  DeleteUserRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<DeleteUserModel> deleteUser() async {
    final response = await dio.post(
      '$baseUrl',
      options: Options(
        headers: {
          'accessToken': true,
        },
      ),
    );

    logger.d(response.data);

    logger.d(
        'deleteUser - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return DeleteUserModel.fromJson(response.data)
          .setType(DeleteUserModelType.delete);
    } else {
      // Bad Request
      throw DeleteUserModelError.fromJson(response.data)
          .setType(DeleteUserModelType.delete);
    }
  }
}
