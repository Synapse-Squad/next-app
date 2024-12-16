class DatabaseException implements Exception {
  const DatabaseException([this.message]);

  final String? message;

  @override
  String toString() => 'DatabaseException($message)';
}

class UnknownDatabaseException extends DatabaseException {
  const UnknownDatabaseException([super.message]);

  @override
  String toString() => 'UnknownDatabaseException($message)';
}

class DatabaseAccessException extends DatabaseException {
  const DatabaseAccessException([super.message]);

  @override
  String toString() => 'DatabaseAccessException($message)';
}
