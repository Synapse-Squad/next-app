import '../../core/exceptions/user_collection_exceptions.dart';
import '../entities/collection_entity.dart';
import '../params/get_collections_params.dart';
import '../repositories/collection_repository.dart';

final class GetCollectionsUseCase {
  const GetCollectionsUseCase(this.collectionRepository);

  final CollectionRepository collectionRepository;

  Future<List<CollectionEntity>> call(GetCollectionsParams? param) async {
    final collections =
        await collectionRepository.getCollections(params: param);

    if (collections.isEmpty) {
      throw const CollectionsNotFoundException();
    }

    return collections;
  }
}
