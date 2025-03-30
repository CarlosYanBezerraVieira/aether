import 'package:http/http.dart' as http;
import 'package:aether/core/network/htttp_client.dart';

class HttpAdapter implements HttpClient {
  final http.Client _client;

  HttpAdapter({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  @override
  Future<HttpReponse> get(String url, {Map<String, String>? headers}) async {
    final reponse = await _client.get(
      Uri.parse(url),
      headers: headers,
    );

    return HttpReponse(
      reponse.statusCode,
      reponse.body,
    );
  }

  @override
  Future<HttpReponse> post(String url,
      {Map<String, String>? headers, body}) async {
    final reponse = await _client.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    return HttpReponse(
      reponse.statusCode,
      reponse.body,
    );
  }

  @override
  Future<HttpReponse> put(String url,
      {Map<String, String>? headers, body}) async {
    final reponse = await _client.put(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    return HttpReponse(
      reponse.statusCode,
      reponse.body,
    );
  }

  @override
  Future<HttpReponse> delete(String url, {Map<String, String>? headers}) async {
    final reponse = await _client.delete(
      Uri.parse(url),
      headers: headers,
    );

    return HttpReponse(
      reponse.statusCode,
      reponse.body,
    );
  }
}
