import 'package:basic_auth_challenge/core/exception/dio_error_utils.dart';
import 'package:dio/dio.dart';

import 'exception_type.dart';
import 'trace_util.dart';

///
/// Helper class for exception handling.
///
class ExceptionUtils implements Exception {
  int? statusCode;
  String? message;
  String? stackTrace;
  ExceptionType? type;

  // private constructor
  ExceptionUtils._();

  // helper method to check and extract information from thrown error
  static ExceptionUtils handleException<T>(T error) {
    if (error is ExceptionUtils) {
      error.stackTrace =
      '{${TraceUtil.getClassName()}} {${TraceUtil.getMethodName()}} -> ${error.stackTrace}';
      return error;
    }

    ExceptionUtils exception = ExceptionUtils._();

    if (error is DioError) {
      exception.type = ExceptionType.NETWORK;
      exception.message = handleDioError(error);
      exception.statusCode = error.response?.statusCode ?? 0;
      exception.stackTrace =
      '{${TraceUtil.getClassName()}} {${TraceUtil.getMethodName()}: ${exception.message}';
    }
    else {
      exception.type = ExceptionType.ERROR;
      exception.message = error.toString();
      exception.statusCode = 0;
      exception.stackTrace =
      '{${TraceUtil.getClassName()}} {${TraceUtil.getMethodName()}: $error}';
    }

    return exception;
  }

  static String getMessage(dynamic error) =>
      error is ExceptionUtils ? error.message ?? "Unknown error" : '$error';

  static String getStackTrace(dynamic error) =>
      error is ExceptionUtils ? error.stackTrace ?? "" : '$error';

  static int? getStatusCode(dynamic error) =>
      error is ExceptionUtils ? error.statusCode ?? -1 : error;

  @override
  String toString() {
    return '\n\n**** ExceptionUtils **** \n** type: $type \n** message: $message \n** stackTrace: $stackTrace}\n';
  }
}
