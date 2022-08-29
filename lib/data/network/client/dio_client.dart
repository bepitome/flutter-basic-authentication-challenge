import 'package:dio/dio.dart';

import 'dio_config.dart';

class DioClient {
  final DioConfigs dioConfigs;
  final Dio _dio;

  DioClient({required this.dioConfigs})
      : _dio = Dio()
    ..options.baseUrl = dioConfigs.baseUrl
    ..options.connectTimeout = dioConfigs.connectionTimeout
    ..options.receiveTimeout = dioConfigs.receiveTimeout;

  Dio get dio => _dio;

  Dio addInterceptors(Iterable<Interceptor> interceptors) {
    return _dio..interceptors.addAll(interceptors);
  }
}