class InvalidTitleException implements Exception {
  const InvalidTitleException([this.message]);

  final String? message;

  @override
  String toString() => 'InvalidTitleException($message)';
}

class InvalidDateException implements Exception {
  const InvalidDateException([this.message]);

  final String? message;

  @override
  String toString() => 'InvalidDateException($message)';
}
