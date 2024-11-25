import '../../enums/collection_types.dart';
import '../use_case.dart';

final class CreateCollectionParams extends Params {
  const CreateCollectionParams({
    required this.title,
    required this.type,
  });

  final String title;
  final CollectionTypes type;

  @override
  List<Object?> get props => [title, type];
}
