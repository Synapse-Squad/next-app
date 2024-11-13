import 'package:drift/drift.dart';

import '../../next_database_service.dart';
import '../tables/collection_types.dart';
import 'collection_types_dao.drift.dart';

@DriftAccessor(tables: [CollectionTypes])
class CollectionTypesDao extends DatabaseAccessor<NextDatabase>
    with $CollectionTypesDaoMixin {
  CollectionTypesDao(super.attachedDatabase);

  Future<List<CollectionType>> getCollectionTypes() =>
      select(collectionTypes).get();

  Future<void> add(CollectionType collectionType) =>
      into(collectionTypes).insert(collectionType);
}
