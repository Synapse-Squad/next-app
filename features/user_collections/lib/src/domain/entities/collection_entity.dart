import 'package:equatable/equatable.dart';
import 'package:next_database_service/next_database_service.dart';

class CollectionEntity extends Equatable {
  const CollectionEntity({
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
  List<Object?> get props => [id, title, type, createdAt];
}
