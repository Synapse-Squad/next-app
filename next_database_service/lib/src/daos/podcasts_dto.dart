import 'package:drift/drift.dart';

import '../../next_database_service.dart';
import '../enums/order_options.dart';
import 'podcasts_dto.drift.dart';

@DriftAccessor(tables: [Podcasts])
class PodcastsDto extends DatabaseAccessor<NextDatabase>
    with $PodcastsDtoMixin {
  PodcastsDto(super.attachedDatabase);

  Future<List<Podcast>> search(String query) =>
      (select(podcasts)..where((p) => p.collectionName.contains(query))).get();

  Future<List<Podcast>> getListByCollectionId(
    int collectionId, {
    OrderOptions orderOption = OrderOptions.newestFirst,
  }) {
    var selector = select(podcasts)
      ..where((p) => p.collectionId.equals(collectionId));

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
}
