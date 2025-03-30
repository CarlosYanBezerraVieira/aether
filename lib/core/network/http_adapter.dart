import 'package:http/http.dart' as http;
import 'package:aether/core/network/htttp_client.dart';

class HttpAdapter implements HttpClient {
  final http.Client _client;
  final String _baseUrl = 'https://api.openweathermap.org/';
  HttpAdapter({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  @override
  Future<HttpResponse> get(String url, {Map<String, String>? headers}) async {
    final response = await _client.get(
      Uri.parse('$_baseUrl$url'),
      headers: headers,
    );

    return HttpResponse(
      response.statusCode,
      response.body,
    );
  }

  @override
  Future<HttpResponse> post(String url,
      {Map<String, String>? headers, body}) async {
    final response = await _client.post(
      Uri.parse('$_baseUrl$url'),
      headers: headers,
      body: body,
    );

    return HttpResponse(
      response.statusCode,
      response.body,
    );
  }

  @override
  Future<HttpResponse> put(String url,
      {Map<String, String>? headers, body}) async {
    final response = await _client.put(
      Uri.parse('$_baseUrl$url'),
      headers: headers,
      body: body,
    );

    return HttpResponse(
      response.statusCode,
      response.body,
    );
  }

  @override
  Future<HttpResponse> delete(String url,
      {Map<String, String>? headers}) async {
    final response = await _client.delete(
      Uri.parse('$_baseUrl$url'),
      headers: headers,
    );

    return HttpResponse(
      response.statusCode,
      response.body,
    );
  }
}
