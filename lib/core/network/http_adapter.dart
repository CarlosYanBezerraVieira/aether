import 'package:http/http.dart' as http;
import 'package:aether/core/network/htttp_client.dart';

class HttpAdapter implements HttpClient {
  final http.Client _client;
  final String baseUrl;

  final String apiKey;
  final String language;

  HttpAdapter({
    http.Client? client,
    required this.baseUrl,
    required this.language,
    required this.apiKey,
  }) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  String _buildUrl(String url) {
    return '$baseUrl$url&appid=$apiKey&lang=$language';
  }

  @override
  Future<HttpResponse> get(String url, {Map<String, String>? headers}) async {
    final fullUrl = _buildUrl(url);
    final response = await _client.get(Uri.parse(fullUrl), headers: headers);
    return HttpResponse(response.statusCode, response.body);
  }

  @override
  Future<HttpResponse> post(String url,
      {Map<String, String>? headers, body}) async {
    final fullUrl = _buildUrl(url);
    final response =
        await _client.post(Uri.parse(fullUrl), headers: headers, body: body);
    return HttpResponse(response.statusCode, response.body);
  }

  @override
  Future<HttpResponse> put(String url,
      {Map<String, String>? headers, body}) async {
    final fullUrl = _buildUrl(url);
    final response =
        await _client.put(Uri.parse(fullUrl), headers: headers, body: body);
    return HttpResponse(response.statusCode, response.body);
  }

  @override
  Future<HttpResponse> delete(String url,
      {Map<String, String>? headers}) async {
    final fullUrl = _buildUrl(url);
    final response = await _client.delete(Uri.parse(fullUrl), headers: headers);
    return HttpResponse(response.statusCode, response.body);
  }
}
