import 'package:equatable/equatable.dart';
import 'package:next_database_service/next_database_service.dart';

import '../../core/exceptions/input_validation_exceptions.dart';

class CollectionEntity extends Equatable {
  const CollectionEntity._({
    required this.id,
    required this.title,
    required this.type,
    required this.createdAt,
  });

  factory CollectionEntity({
    required int id,
    required String title,
    required CollectionTypes type,
    required DateTime createdAt,
  }) {
    if (title.trim().length < 3) {
      throw const InvalidTitleException('Title can not be empty!');
    }

    return CollectionEntity._(
      id: id,
      title: title,
      type: type,
      createdAt: createdAt,
    );
  }

  final int id;
  final String title;
  final CollectionTypes type;
  final DateTime createdAt;

  @override
  List<Object?> get props => [id, title, type, createdAt];
}
