import 'package:next_database_service/next_database_service.dart';

class UserCollectionEntity {
  const UserCollectionEntity({
    required this.id,
    required this.title,
    required this.type,
    required this.createdAt,
  });

  final int id;
  final String title;
  final CollectionTypes type;
  final DateTime createdAt;

  @override
  String toString() {
    return '''UserCollectionEntity(
    id: $id,
    title: $title,
    type: $type,
    createdAt: $createdAt,
    )''';
  }

  @override
  int get hashCode => Object.hashAll([id, title, type, createdAt]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCollectionEntity &&
          id == other.id &&
          title == other.title &&
          type == other.type &&
          createdAt == other.createdAt;
}
