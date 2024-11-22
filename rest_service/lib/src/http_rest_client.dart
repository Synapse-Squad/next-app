import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'http_request_type.dart';
import 'rest_client.dart';
import 'rest_exceptions.dart' as exceptions;

final class HttpRestClient extends RestClient {
  HttpRestClient({
    required this.client,
    required super.baseUrl,
    super.headers,
  });

  final http.Client client;

  @override
  Future<Map<String, dynamic>?> get(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) =>
      send(
        url,
        requestType: HttpRequestType.get,
        headers: headers,
        queryParameters: queryParameters,
      );

  @protected
  @visibleForTesting
  Future<Map<String, dynamic>?> send(
    String url, {
    required HttpRequestType requestType,
    required Map<String, String>? headers,
    Map<String, String>? queryParameters,
    Object? body,
  }) async {
    try {
      final generalHeaders = await super.headers?.call();
      final uri = buildUri(url, queryParameters: queryParameters);

      final response = switch (requestType) {
        HttpRequestType.get => await client.get(
            uri,
            headers: {
              if (generalHeaders != null) ...generalHeaders,
              if (headers != null) ...headers,
            },
          ),
        HttpRequestType.post => await client.post(
            uri,
            headers: {
              if (generalHeaders != null) ...generalHeaders,
              if (headers != null) ...headers,
            },
            body: jsonEncode(body),
          ),
        _ => throw UnimplementedError(),
      };

      final statusCode = response.statusCode;
      if (statusCode >= 200 && statusCode < 400) {
        return jsonDecode(response.body);
      } else if (statusCode >= 400 && statusCode < 500) {
        throw exceptions.ClientException(
          statusCode: statusCode,
          error: response.body,
        );
      } else {
        throw exceptions.ServerException(
          statusCode: statusCode,
          error: response.body,
        );
      }
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        exceptions.UnknownRestClientException(
          message: error.toString(),
          error: error,
        ),
        stackTrace,
      );
    }
  }
}
