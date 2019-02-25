import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/// API Manager
///
/// This class will manage all network requests for the project
class ApiManager {
  /// Make a POST request to [url] with [body] and [headers]. A [client]
  /// parameter has been placed to help with mocking while testing
  Future<http.Response> makePostRequestWithClient({
    @required String url,
    @required String body,
    Map<String, String> headers,
    http.Client client,
  }) async {
    http.Client httpClient = client ?? http.Client();
    http.Response response = await httpClient.post(
      url,
      body: body,
      headers: headers,
    );

    httpClient.close();

    return response;
  }

  /// Makes a GET request to [url] with [header]. A [client] parameter has been
  /// placed to help with mocking while testing;
  Future<http.Response> makeGetRequestWithClient({
    @required String url,
    Map<String, String> headers,
    http.Client client,
  }) async {
    http.Client httpClient = client ?? http.Client();
    http.Response response = await httpClient.get(
      url,
      headers: headers,
    );

    httpClient.close();

    return response;
  }

  /// Make a POST request to [url] with [body] and [headers].
  Future<http.Response> makePostRequest({
    @required String url,
    @required String body,
    Map<String, String> headers,
  }) async {
    return await makePostRequestWithClient(
      url: url,
      body: body,
      headers: headers,
    );
  }

  /// Makes a GET request to [url] with [header].
  Future<http.Response> makeGetRequest({
    @required String url,
    Map<String, String> headers,
  }) async {
    return await makeGetRequestWithClient(
      url: url,
      headers: headers,
    );
  }
}