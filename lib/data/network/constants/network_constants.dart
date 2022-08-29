class NetworkConstants {
  NetworkConstants._();

  // URLs:----------------------------------------------------------------------
  static const String BASE_URL_DEV = 'http://161.35.99.225';
  static const String BASE_URL_PRD = 'http://161.35.99.225';

  // timeouts:------------------------------------------------------------------
  static const int CONNECTION_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 10000;

  // endpoints:-----------------------------------------------------------------
  static const String login = '/api/v1/auth/login';
  static const String allUsers = '/api/v1/users';
  static const String userInfo = '/api/v1/users/:id';
}