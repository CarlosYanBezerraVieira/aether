abstract class HttpClient {
  Future<HttpReponse> get(String url, {Map<String, String> headers});
  Future<HttpReponse> post(String url,
      {Map<String, String> headers, String? body});
  Future<HttpReponse> put(String url,
      {Map<String, String> headers, String? body});
  Future<HttpReponse> delete(String url, {Map<String, String> headers});
}

class HttpReponse {
  final int statusCode;
  final String body;
  HttpReponse(
    this.statusCode,
    this.body,
  );
}
