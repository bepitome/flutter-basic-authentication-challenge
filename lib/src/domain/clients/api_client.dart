abstract class APIClient {
  const APIClient();

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? query,
  });
  Future<dynamic> post({
    required String endPoint,
    Map<String, dynamic>? query,
  });
}
