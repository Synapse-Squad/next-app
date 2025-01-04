import 'package:next_database_service/next_database_service.dart';

import '../entities/collection_entity.dart';

abstract interface class CollectionRepository {
  Future<int> createCollection(CollectionEntity entity);

  Future<List<CollectionEntity>> getCollections({
    CollectionTypes? type,
    OrderOptions? orderOptions,
  });

  Future<CollectionEntity?> getCollectionOrNull({
    required String title,
    required CollectionTypes type,
  });

  /// listen to collections by type and order options
  Stream<List<CollectionEntity>> listenToCollections({
    CollectionTypes? type,
    OrderOptions? orderOptions,
  });
}
