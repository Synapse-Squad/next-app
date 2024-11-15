import 'package:drift/drift.dart';

import '../../next_database_service.dart';

@DataClassName('Movie')
class Movies extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get posterPath => text().nullable()();
  TextColumn get overview => text().nullable()();
  TextColumn get title => text().nullable()();
  DateTimeColumn get releaseDate => dateTime().nullable()();
  RealColumn get voteAverage => real().nullable()();
  IntColumn get watched => intEnum<WatchStatus>()
      .withDefault(Constant(WatchStatus.notWatched.index))();
  IntColumn get userRating => integer().nullable()();
  IntColumn get collectionId => integer().references(
        UserCollections,
        #id,
        onDelete: KeyAction.cascade,
      )();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
