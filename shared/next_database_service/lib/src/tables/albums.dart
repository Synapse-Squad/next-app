import 'package:drift/drift.dart';

import '../../next_database_service.dart';

@DataClassName('Album')
class Albums extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get artistName => text().nullable()();
  TextColumn get collectionName => text().nullable()();
  TextColumn get collectionViewUrl => text().nullable()();
  TextColumn get artworkUrl60 => text().nullable()();
  IntColumn get trackCount => integer().nullable()();
  TextColumn get copyright => text().nullable()();
  DateTimeColumn get releaseDate => dateTime().nullable()();
  TextColumn get primaryGenreName => text().nullable()();
  IntColumn get listened => intEnum<ListenStatus>()
      .withDefault(Constant(ListenStatus.notListened.index))();
  IntColumn get userRating => integer().nullable()();
  IntColumn get collectionId => integer().references(
        UserCollections,
        #id,
        onDelete: KeyAction.cascade,
      )();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
