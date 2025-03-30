abstract class HttpClient {
  Future<HttpResponse> get(String url, {Map<String, String> headers});
  Future<HttpResponse> post(String url,
      {Map<String, String> headers, String? body});
  Future<HttpResponse> put(String url,
      {Map<String, String> headers, String? body});
  Future<HttpResponse> delete(String url, {Map<String, String> headers});
}

class HttpResponse {
  final int statusCode;
  final String body;
  HttpResponse(
    this.statusCode,
    this.body,
  );
}
