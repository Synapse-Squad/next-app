import 'package:drift/drift.dart';

import '../../next_database_service.dart';

@DataClassName('Movie')
class Movies extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get posterPath => text()();
  TextColumn get overview => text()();
  TextColumn get title => text()();
  DateTimeColumn get releaseDate => dateTime()();
  RealColumn get voteAverage => real()();
  IntColumn get watched => integer()(); // 0 - not watched, 1 - watched
  IntColumn get userRating => integer()();
  IntColumn get collectionId => integer().references(
        UserCollections,
        #id,
        onDelete: KeyAction.cascade,
      )();
}
