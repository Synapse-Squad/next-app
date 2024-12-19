import '../../core/exceptions/user_collection_exceptions.dart';
import '../entities/collection_entity.dart';
import '../params/create_collection_params.dart';
import '../repositories/collection_repository.dart';

final class CreateCollectionUseCase {
  const CreateCollectionUseCase(this.collectionRepository);

  final CollectionRepository collectionRepository;

  Future<int> call(CollectionParams param) async {
    final collection = await collectionRepository.getCollectionOrNull(
      title: param.title,
      type: param.type,
    );

    if (collection != null) {
      throw const SameCollectionFoundException();
    }

    final entity = CollectionEntity(
      title: param.title,
      type: param.type,
    );

    return collectionRepository.createCollection(entity);
  }
}
  