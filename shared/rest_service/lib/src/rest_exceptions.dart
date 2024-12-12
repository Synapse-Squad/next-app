class ClientException implements Exception {
  ClientException({
    this.message = 'ClientException',
    this.statusCode,
    this.error,
  });

  final String message;
  final int? statusCode;
  final dynamic error;
}

class ServerException implements Exception {
  ServerException({
    this.message = 'ServerException',
    this.statusCode,
    this.error,
  });

  final String message;
  final int? statusCode;
  final dynamic error;
}

class UnknownRestClientException implements Exception {
  UnknownRestClientException({
    this.message = 'ServerException',
    this.error,
  });

  final String message;
  final dynamic error;
}
