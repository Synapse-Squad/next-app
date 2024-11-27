import '../entities/collection_entity.dart';
import '../params/create_collection_params.dart';
import '../params/get_collections_params.dart';

abstract interface class CollectionRepository {
  Future<List<CollectionEntity>> getCollections({GetCollectionsParams? params});

  Future<void> createCollection(CreateCollectionParams params);
}
