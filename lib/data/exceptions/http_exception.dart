class HttpException {
  final int statusCode;
  final String message;

  const HttpException({required this.statusCode, required this.message});

  @override
  String toString() {
    return 'HttpException: code: $statusCode, message: $message';
  }
}
