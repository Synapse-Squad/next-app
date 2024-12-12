import 'dart:convert';

typedef HeaderBuilder = Future<Map<String, dynamic>?> Function();

abstract class RestClient {
  RestClient({
    required String baseUrl,
    this.headers,
  }) : baseUri = Uri.parse(baseUrl);

  final Uri baseUri;
  final HeaderBuilder? headers;

  Future<Map<String, dynamic>?> get(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  });

  Uri buildUri(
    String path, {
    Map<String, String>? queryParameters,
  }) {
    final finalPath = baseUri.path + path;

    final uri = baseUri.replace(
      path: finalPath,
      queryParameters: {
        ...baseUri.queryParameters,
        ...?queryParameters,
      },
    );

    return uri;
  }

  dynamic decodeBody(String data) => jsonDecode(data);
}
