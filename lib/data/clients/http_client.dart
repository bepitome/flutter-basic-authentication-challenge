import 'dart:convert';
import 'package:basic_authentication_flutter_challenge/data/constants/api_constants.dart';
import 'package:basic_authentication_flutter_challenge/data/exceptions/http_exception.dart';
import 'package:basic_authentication_flutter_challenge/domain/clients/api_client.dart';
import 'package:basic_authentication_flutter_challenge/services/access_token.dart';
import 'package:http/http.dart' as http;

class HttpClient implements APIClient {
  final AccessToken accessToken;

  const HttpClient({required this.accessToken});

  @override
  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    Uri url = Uri.parse('$kBaseUrl$endPoint').replace(
      queryParameters: query,
    );
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': await accessToken.read(),
    };
    final response = await http.get(url, headers: headers);
    final body = jsonDecode(response.body);
    final result = body['result'];
    if (response.statusCode == 200) {
      return result;
    } else {
      throw HttpException(
        statusCode: response.statusCode,
        message: result as String,
      );
    }
  }

  @override
  Future<dynamic> post({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    Uri url = Uri.parse('$kBaseUrl$endPoint').replace(
      queryParameters: query,
    );
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': await accessToken.read(),
    };
    final response = await http.post(url, headers: headers);
    final body = jsonDecode(response.body);
    final result = body['result'];
    if (response.statusCode == 200) {
      return result;
    } else {
      throw HttpException(
        statusCode: response.statusCode,
        message: result as String,
      );
    }
  }
}
