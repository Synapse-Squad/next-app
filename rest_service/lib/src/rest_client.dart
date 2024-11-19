import 'dart:convert';

typedef HeaderBuilder = Future<Map<String, dynamic>?> Function();

abstract class RestClient {
  const RestClient({
    required this.baseUrl,
    this.headers,
  });

  final String? baseUrl;
  final HeaderBuilder? headers;

  Future<Map<String, dynamic>?> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Uri buildUri(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    if (baseUrl != null) {
      final queriesAsString = queryParameters?.map(
        (key, value) {
          return MapEntry(key, value.toString());
        },
      );

      final result = Uri.https(baseUrl!, path, queriesAsString);
      return result;
    }

    return Uri.parse(path);
  }

  dynamic decodeBody(String data) => jsonDecode(data);
}
