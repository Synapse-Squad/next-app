import '../core/use_case/params/create_collection_params.dart';
import '../core/use_case/params/get_collections_params.dart';
import '../entities/collection_entity.dart';

abstract interface class CollectionRepository {
  Future<List<CollectionEntity>> getCollections({GetCollectionsParams? params});

  Future<void> createCollection(CreateCollectionParams params);
}
