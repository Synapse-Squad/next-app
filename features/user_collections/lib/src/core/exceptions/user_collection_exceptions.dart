abstract class DomainException implements Exception {
  const DomainException([this.message]);

  final String? message;

  @override
  String toString() => '$runtimeType($message)';
}

class UserCollectionException extends DomainException {
  const UserCollectionException([super.message]);
}

class CollectionsNotFoundException extends DomainException {
  const CollectionsNotFoundException([super.message]);
}

class CollectionNotFoundException extends DomainException {
  const CollectionNotFoundException([super.message]);
}

class SameCollectionFoundException extends DomainException {
  const SameCollectionFoundException([super.message]);
}
