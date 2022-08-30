import 'dart:convert';
import 'package:basic_authentication_flutter_challenge/injection.dart';
import 'package:basic_authentication_flutter_challenge/src/data/constants/api_constants.dart';
import 'package:basic_authentication_flutter_challenge/src/data/exceptions/http_exception.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/clients/api_client.dart';
import 'package:basic_authentication_flutter_challenge/src/services/tokens_service.dart';
import 'package:http/http.dart' as http;

/// A helper class for wrapping the 3rd-party http package

class HttpClient implements APIClient {
  const HttpClient();

  @override
  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    final auth = locator<TokensService>();
    Uri url = Uri.parse('$kApiBaseUrl$endPoint').replace(
      queryParameters: query,
    );
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': await auth.getLocalAccessToken(),
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
    final auth = locator<TokensService>();
    Uri url = Uri.parse('$kApiBaseUrl$endPoint').replace(
      queryParameters: query,
    );
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': await auth.getLocalAccessToken(),
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
