import 'package:drift/drift.dart';

import '../../next_database_service.dart';
import '../tables/albums.dart';
import '../tables/albums.drift.dart';
import 'albums_dao.drift.dart';

@DriftAccessor(tables: [Albums])
class AlbumsDao extends DatabaseAccessor<NextDatabase> with $AlbumsDaoMixin {
  AlbumsDao(super.attachedDatabase);

  Future<List<Album>> search(String query) =>
      (select(albums)..where((a) => a.collectionName.contains(query))).get();

  Future<List<Album>> getListByCollectionId(
    int collectionId, {
    OrderOptions orderOption = OrderOptions.newestFirst,
  }) {
    var selector = select(albums)
      ..where((a) => a.collectionId.equals(collectionId));

    selector = selector
      ..orderBy(
        [
          switch (orderOption) {
            OrderOptions.fromAtoZ => (a) => OrderingTerm(
                  expression: a.collectionName,
                ),
            OrderOptions.fromZtoA => (a) => OrderingTerm(
                  expression: a.collectionName,
                  mode: OrderingMode.desc,
                ),
            OrderOptions.newestFirst => (a) => OrderingTerm(
                  expression: a.createdAt,
                  mode: OrderingMode.desc,
                ),
            OrderOptions.oldestFirst => (a) => OrderingTerm(
                  expression: a.createdAt,
                ),
            OrderOptions.highRatingFirst => (a) => OrderingTerm(
                  expression: a.userRating,
                  mode: OrderingMode.desc,
                ),
            OrderOptions.lowRatingFirst => (a) => OrderingTerm(
                  expression: a.userRating,
                ),
          }
        ],
      );

    return selector.get();
  }

  Future<int> deleteById(int id) =>
      (delete(albums)..where((c) => c.id.equals(id))).go();

  Future<Album> get(int id) =>
      (select(albums)..where((a) => a.id.equals(id))).getSingle();

  Future<void> markAsListened(int id) =>
      (update(albums)..where((a) => a.id.equals(id))).write(
        const AlbumsCompanion(listened: Value(ListenStatus.listened)),
      );

  Future<void> markAsNotListened(int id) =>
      (update(albums)..where((a) => a.id.equals(id))).write(
        const AlbumsCompanion(listened: Value(ListenStatus.notListened)),
      );

  Future<int> add(AlbumsCompanion companion) => into(albums).insert(companion);
}
