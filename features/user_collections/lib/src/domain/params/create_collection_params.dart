import 'package:equatable/equatable.dart';
import 'package:next_database_service/next_database_service.dart';

final class CollectionParams extends Equatable {
  const CollectionParams({
    required this.title,
    required this.type,
  });

  final String title;
  final CollectionTypes type;

  @override
  List<Object?> get props => [title, type];
}
