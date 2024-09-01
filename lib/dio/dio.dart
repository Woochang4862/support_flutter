import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/secure_storage/secure_storage.dart';
import 'package:support_flutter/utils/interceptors/default_interceptor.dart';
import 'package:support_flutter/utils/interceptors/token_interceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();

  final storage = ref.watch(secureStorageProvider);

  dio.interceptors.addAll([
    DefaultInterceptor(),
    TokenInterceptor(storage: storage, ref: ref),
  ]);

  return dio;
});