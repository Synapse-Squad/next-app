import 'package:next_database_service/next_database_service.dart';

import '../entities/plain/collection_plain.dart';

abstract interface class CreateCollectionDataSource {
  Future<int> createCollection(CollectionPlain plain);

  Future<CollectionPlain?> getCollectionOrNull({
    required final String title,
    required final CollectionTypes type,
  });
}
