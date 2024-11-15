import 'package:drift/drift.dart';
import 'package:next_database_service/src/enums/order_options.dart';

import '../../next_database_service.dart';
import '../enums/collection_types.dart';
import 'user_collections_dao.drift.dart';

@DriftAccessor(tables: [UserCollections])
class UserCollectionsDao extends DatabaseAccessor<NextDatabase>
    with $UserCollectionsDaoMixin {
  UserCollectionsDao(super.attachedDatabase);

  Future<List<UserCollection>> searchForCollection(String query) =>
      (select(userCollections)..where((c) => c.title.contains(query))).get();

  Future<List<UserCollection>> getCollections({
    CollectionTypes? collectionType,
    OrderOptions orderOption = OrderOptions.newestFirst,
  }) {
    var selector = select(userCollections);

    if (collectionType != null) {
      selector = selector..where((c) => c.typeId.equals(collectionType.typeId));
    }

    selector = selector
      ..orderBy(
        [
          switch (orderOption) {
            OrderOptions.fromAtoZ => (c) => OrderingTerm(expression: c.title),
            OrderOptions.fromZtoA => (c) => OrderingTerm(
                  expression: c.title,
                  mode: OrderingMode.desc,
                ),
            OrderOptions.newestFirst => (c) => OrderingTerm(
                  expression: c.createdAt,
                ),
            OrderOptions.oldestFirst => (c) => OrderingTerm(
                  expression: c.createdAt,
                  mode: OrderingMode.desc,
                ),
          }
        ],
      );

    return selector.get();
  }

  Future<int> deleteById(int collectionId) =>
      (delete(userCollections)..where((c) => c.id.equals(collectionId))).go();

  Future<int> add(UserCollectionsCompanion companion) =>
      into(userCollections).insert(companion);
}
