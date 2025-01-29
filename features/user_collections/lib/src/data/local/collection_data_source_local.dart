import 'package:next_database_service/next_database_service.dart';

import '../../application/entities/plain/collection_plain.dart';

abstract interface class CollectionDataSourceLocal {
  Future<List<CollectionPlain>> getCollections({
    CollectionTypes? type,
    OrderOptions? orderOptions,
  });

  Future<int> createCollection(CollectionPlain plain);

  Future<CollectionPlain?> getCollectionOrNull({
    required final String title,
    required final CollectionTypes type,
  });
}
