import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthInterceptor extends Interceptor {
  final AsyncValueGetter<String?> accessToken;
  final AsyncValueGetter<int?> id;

  AuthInterceptor({
    required this.id,
    required this.accessToken,
  });

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {

    // access token
    final String token = await accessToken() ?? '';
    if (token.isNotEmpty) {
      options.headers.putIfAbsent('Authorization', () => '$token');
    }

    options.headers.putIfAbsent('X-Device-UUID', () => id);

    super.onRequest(options, handler);
  }
}