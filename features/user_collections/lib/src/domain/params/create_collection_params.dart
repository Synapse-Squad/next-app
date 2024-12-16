import 'package:equatable/equatable.dart';
import 'package:next_database_service/next_database_service.dart';

import '../../core/exceptions/input_validation_exceptions.dart';

final class CollectionParams extends Equatable {
  const CollectionParams._({
    required this.title,
    required this.type,
  });

  factory CollectionParams({
    required String title,
    required CollectionTypes type,
  }) {
    if (title.trim().isEmpty) {
      throw const InvalidTitleException('Title can not be empty!');
    }
    return CollectionParams._(title: title, type: type);
  }

  final String title;
  final CollectionTypes type;

  @override
  List<Object?> get props => [title, type];
}
