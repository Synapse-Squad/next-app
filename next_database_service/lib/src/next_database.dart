import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'daos/collection_types_dao.dart';
import 'next_database.drift.dart';
import 'tables/collection_types.dart';
import 'tables/movies.dart';
import 'tables/user_collections.dart';

@DriftDatabase(
  tables: [UserCollections, CollectionTypes, Movies],
  daos: [CollectionTypesDao],
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
