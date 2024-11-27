import 'package:drift/drift.dart';

import '../../next_database_service.dart';
import 'user_collections_dao.drift.dart';

@DriftAccessor(tables: [UserCollections])
class UserCollectionsDao extends DatabaseAccessor<NextDatabase>
    with $UserCollectionsDaoMixin {
  UserCollectionsDao(super.attachedDatabase);

  Future<List<UserCollection>> search(String query) =>
      (select(userCollections)..where((c) => c.title.contains(query))).get();

  Future<List<UserCollection>> getCollections({
    CollectionTypes? collectionType,
    OrderOptions? orderOption,
  }) {
    var selector = select(userCollections);
    orderOption ??= OrderOptions.newestFirst;

    if (collectionType != null && collectionType != CollectionTypes.all) {
      selector = selector..where((c) => c.typeId.equals(collectionType.index));
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
                  mode: OrderingMode.desc,
                ),
            OrderOptions.oldestFirst => (c) => OrderingTerm(
                  expression: c.createdAt,
                ),
            _ => throw UnimplementedError(),
          }
        ],
      );

    return selector.get();
  }

  Future<UserCollection?> getCollection({
    required String title,
    required CollectionTypes collectionType,
  }) =>
      (select(userCollections)
            ..where(
              (c) {
                return Expression.and([
                  c.title.equals(title),
                  c.typeId.equals(collectionType.index),
                ]);
              },
            ))
          .getSingleOrNull();

  Future<int> deleteById(int collectionId) =>
      (delete(userCollections)..where((c) => c.id.equals(collectionId))).go();

  Future<int> add(UserCollectionsCompanion companion) =>
      into(userCollections).insert(companion);
}
