import 'package:next_database_service/next_database_service.dart';

import '../entities/plain/collection_plain.dart';

abstract interface class GetCollectionsDataSource {
  Future<List<CollectionPlain>> getCollections({
    CollectionTypes? type,
    OrderOptions? orderOptions,
  });
}
