class InvalidTitleException implements Exception {
  const InvalidTitleException([this.message]);

  final String? message;

  @override
  String toString() => 'InvalidTitleException($message)';
}
