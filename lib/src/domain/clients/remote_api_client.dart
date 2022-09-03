abstract class RemoteAPIClient {
  const RemoteAPIClient();

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? query,
  });
  Future<dynamic> post({
    required String endPoint,
    Map<String, dynamic>? query,
  });
}
