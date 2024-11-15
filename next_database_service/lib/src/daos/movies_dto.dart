import 'package:drift/drift.dart';
import 'package:next_database_service/src/enums/watch_status.dart';

import '../../next_database_service.dart';
import '../enums/order_options.dart';
import 'movies_dto.drift.dart';

@DriftAccessor(tables: [Movies])
class MoviesDto extends DatabaseAccessor<NextDatabase> with $MoviesDtoMixin {
  MoviesDto(super.attachedDatabase);

  Future<List<Movie>> search(String query) =>
      (select(movies)..where((m) => m.title.contains(query))).get();

  Future<List<Movie>> getListByCollectionId(
    int collectionId, {
    OrderOptions orderOption = OrderOptions.newestFirst,
  }) {
    var selector = select(movies)
      ..where((m) => m.collectionId.equals(collectionId));

    selector = selector
      ..orderBy(
        [
          switch (orderOption) {
            OrderOptions.fromAtoZ => (m) => OrderingTerm(
                  expression: m.title,
                ),
            OrderOptions.fromZtoA => (m) => OrderingTerm(
                  expression: m.title,
                  mode: OrderingMode.desc,
                ),
            OrderOptions.newestFirst => (m) => OrderingTerm(
                  expression: m.createdAt,
                  mode: OrderingMode.desc,
                ),
            OrderOptions.oldestFirst => (m) => OrderingTerm(
                  expression: m.createdAt,
                ),
            OrderOptions.highRatingFirst => (m) => OrderingTerm(
                  expression: m.userRating,
                  mode: OrderingMode.desc,
                ),
            OrderOptions.lowRatingFirst => (m) => OrderingTerm(
                  expression: m.userRating,
                ),
          }
        ],
      );

    return selector.get();
  }

  Future<int> deleteById(int id) =>
      (delete(movies)..where((m) => m.id.equals(id))).go();

  Future<Movie> get(int id) =>
      (select(movies)..where((m) => m.id.equals(id))).getSingle();

  Future<void> markAsWatched(int id) =>
      (update(movies)..where((m) => m.id.equals(id))).write(
        const MoviesCompanion(watched: Value(WatchStatus.watched)),
      );

  Future<int> markAsNotWatched(int id) =>
      (update(movies)..where((m) => m.id.equals(id))).write(
        const MoviesCompanion(watched: Value(WatchStatus.notWatched)),
      );
}
