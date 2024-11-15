import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'daos/albums_dao.dart';
import 'daos/books_dto.dart';
import 'daos/podcasts_dto.dart';
import 'daos/user_collections_dao.dart';
import 'next_database.drift.dart';
import 'tables/albums.dart';
import 'tables/books.dart';
import 'tables/movies.dart';
import 'tables/podcasts.dart';
import 'tables/user_collections.dart';

@DriftDatabase(
  tables: [
    UserCollections,
    Movies,
    Albums,
    Podcasts,
    Books,
  ],
  daos: [
    UserCollectionsDao,
    AlbumsDao,
    PodcastsDto,
    BooksDto,
  ],
)
class NextDatabase extends $NextDatabase {
  NextDatabase() : super(_openConnection());

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
        // ....
      },
    );
  }

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'next_database');
  }
}
