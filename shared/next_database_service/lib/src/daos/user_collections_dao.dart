import 'package:drift/drift.dart';

import '../../next_database_service.dart';
import '../mixin/exception_handler_mixin.dart';
import 'user_collections_dao.drift.dart';

@DriftAccessor(tables: [UserCollections])
class UserCollectionsDao extends DatabaseAccessor<NextDatabase>
    with $UserCollectionsDaoMixin, ExceptionHandlerMixin {
  UserCollectionsDao(super.attachedDatabase);

  Future<List<UserCollection>> search(String query) =>
      handle<List<UserCollection>>(() {
        return (select(userCollections)..where((c) => c.title.contains(query)))
            .get();
      });

  Future<List<UserCollection>> getCollections({
    CollectionTypes? collectionType,
    OrderOptions? orderOption,
  }) =>
      handle<List<UserCollection>>(() async {
        var selector = select(userCollections);
        orderOption ??= OrderOptions.newestFirst;

        if (collectionType != null && collectionType != CollectionTypes.all) {
          selector = selector
            ..where((c) => c.typeId.equals(collectionType.index));
        }

        selector = selector
          ..orderBy(
            [
              switch (orderOption) {
                OrderOptions.fromAtoZ => (c) =>
                    OrderingTerm(expression: c.title),
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

        final collections = await selector.get();
        return collections;
      });

  Future<UserCollection?> getCollection({
    required String title,
    required CollectionTypes collectionType,
  }) =>
      handle<UserCollection?>(() async {
        final collection = await (select(userCollections)
              ..where(
                (c) {
                  return Expression.and([
                    c.title.equals(title),
                    c.typeId.equals(collectionType.index),
                  ]);
                },
              ))
            .getSingleOrNull();

        return collection;
      });

  Future<int> deleteById(int collectionId) => handle<int>(() {
        return (delete(userCollections)
              ..where((c) => c.id.equals(collectionId)))
            .go();
      });

  Future<int> add(UserCollectionsCompanion companion) => handle<int>(() {
        return into(userCollections).insert(companion);
      });
}
