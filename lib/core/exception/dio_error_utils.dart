import 'package:dio/dio.dart';

String handleDioError(DioError error) {
  const defaultError = "Unknown error occurred";
  if (error is! DioError) {
    return defaultError;
  }

  switch (error.type) {
    case DioErrorType.cancel:
      return "Request to API server was cancelled";
    case DioErrorType.connectTimeout:
      return "Connection timeout with API server";
    case DioErrorType.receiveTimeout:
      return "Receive timeout in connection with API server";
    case DioErrorType.response:
      final message = error.response!.data['message'] ??
          "Receive timeout in connection with API server";
      return message;
    case DioErrorType.sendTimeout:
      return "Send timeout in connection with API server";
    case DioErrorType.other:
      return "Connection to API server failed due to internet connection";
    default:
      return defaultError;
  }
}