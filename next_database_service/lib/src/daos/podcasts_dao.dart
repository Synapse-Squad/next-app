import 'package:drift/drift.dart';

import '../../next_database_service.dart';
import '../tables/podcasts.dart';

@DriftAccessor(tables: [Podcasts])
class PodcastsDao extends DatabaseAccessor<NextDatabase>
    with $PodcastsDaoMixin {
  PodcastsDao(super.attachedDatabase);

  Future<List<Podcast>> search({
    required String query,
    required int collectionId,
  }) =>
      (select(podcasts)
            ..where((a) => Expression.and([
                  a.collectionName.contains(query),
                  a.collectionId.equals(collectionId),
                ])))
          .get();

  Future<List<Podcast>> getListByCollectionId(
    int collectionId, {
    OrderOptions? orderOption,
  }) {
    var selector = select(podcasts)
      ..where((p) => p.collectionId.equals(collectionId));
    orderOption ??= OrderOptions.newestFirst;

    selector = selector
      ..orderBy(
        [
          switch (orderOption) {
            OrderOptions.fromAtoZ => (p) => OrderingTerm(
                  expression: p.collectionName,
                ),
            OrderOptions.fromZtoA => (p) => OrderingTerm(
                  expression: p.collectionName,
                  mode: OrderingMode.desc,
                ),
            OrderOptions.newestFirst => (p) => OrderingTerm(
                  expression: p.createdAt,
                  mode: OrderingMode.desc,
                ),
            OrderOptions.oldestFirst => (p) => OrderingTerm(
                  expression: p.createdAt,
                ),
            OrderOptions.highRatingFirst => (p) => OrderingTerm(
                  expression: p.userRating,
                  mode: OrderingMode.desc,
                ),
            OrderOptions.lowRatingFirst => (p) => OrderingTerm(
                  expression: p.userRating,
                ),
          }
        ],
      );

    return selector.get();
  }

  Future<int> deleteById(int id) =>
      (delete(podcasts)..where((p) => p.id.equals(id))).go();

  Future<Podcast> get(int id) =>
      (select(podcasts)..where((p) => p.id.equals(id))).getSingle();

  Future<void> markAsListened(int id) =>
      (update(podcasts)..where((p) => p.id.equals(id))).write(
        const PodcastsCompanion(listened: Value(ListenStatus.listened)),
      );

  Future<int> markAsNotListened(int id) =>
      (update(podcasts)..where((p) => p.id.equals(id))).write(
        const PodcastsCompanion(listened: Value(ListenStatus.notListened)),
      );

  Future<int> add(PodcastsCompanion companion) =>
      into(podcasts).insert(companion);
}
