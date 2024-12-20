import 'package:next_database_service/next_database_service.dart';

import '../entities/collection_entity.dart';
import '../params/create_collection_params.dart';
import '../params/get_collections_params.dart';

abstract interface class CollectionRepository {
  Future<int> createCollection(CollectionEntity entity);

  Future<List<CollectionEntity>> getCollections({GetCollectionsParams? params});

  Future<CollectionEntity> getCollection(CollectionParams params);

  Future<CollectionEntity?> getCollectionOrNull({
    required String title,
    required CollectionTypes type,
  });
}
