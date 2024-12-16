import '../entities/collection_entity.dart';
import '../params/create_collection_params.dart';
import '../params/get_collections_params.dart';

abstract interface class CollectionRepository {
  Future<int> createCollection(CollectionParams params);

  Future<List<CollectionEntity>> getCollections({GetCollectionsParams? params});

  Future<CollectionEntity> getCollection(CollectionParams params);

  Future<CollectionEntity?> getCollectionOrNull(CollectionParams params);
}
