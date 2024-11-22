import 'package:drift/drift.dart';

import '../../next_database_service.dart';
import '../tables/books.dart';
import '../tables/books.drift.dart';
import 'books_dao.drift.dart';

@DriftAccessor(tables: [Books])
class BooksDao extends DatabaseAccessor<NextDatabase> with $BooksDaoMixin {
  BooksDao(super.attachedDatabase);

  Future<List<Book>> search(String query) =>
      (select(books)..where((b) => b.title.contains(query))).get();

  Future<List<Book>> getListByCollectionId(
    int collectionId, {
    OrderOptions orderOption = OrderOptions.newestFirst,
  }) {
    var selector = select(books)
      ..where((b) => b.collectionId.equals(collectionId));

    selector = selector
      ..orderBy(
        [
          switch (orderOption) {
            OrderOptions.fromAtoZ => (b) => OrderingTerm(
                  expression: b.title,
                ),
            OrderOptions.fromZtoA => (b) => OrderingTerm(
                  expression: b.title,
                  mode: OrderingMode.desc,
                ),
            OrderOptions.newestFirst => (b) => OrderingTerm(
                  expression: b.createdAt,
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
      (delete(books)..where((b) => b.id.equals(id))).go();

  Future<Book> get(int id) =>
      (select(books)..where((b) => b.id.equals(id))).getSingle();

  Future<void> markAsRead(int id) =>
      (update(books)..where((b) => b.id.equals(id))).write(
        const BooksCompanion(read: Value(ReadStatus.read)),
      );

  Future<int> markAsNotRead(int id) =>
      (update(books)..where((b) => b.id.equals(id))).write(
        const BooksCompanion(read: Value(ReadStatus.notRead)),
      );
}
