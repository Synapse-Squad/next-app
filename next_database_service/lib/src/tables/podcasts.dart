import 'package:drift/drift.dart';

import '../../next_database_service.dart';
import '../type_converters/genres_converter.dart';

@DataClassName('Podcast')
class Podcasts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get artworkUrl60 => text().nullable()();
  TextColumn get trackName => text().nullable()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get releaseDate => dateTime().nullable()();
  TextColumn get collectionViewUrl => text().nullable()();
  TextColumn get trackViewUrl => text().nullable()();
  IntColumn get trackTimeMillis => integer().nullable()();
  TextColumn get collectionName => text().nullable()();
  IntColumn get listened => intEnum<ListenStatus>()
      .withDefault(Constant(ListenStatus.notListened.index))();
  IntColumn get userRating => integer().nullable()();
  TextColumn get genres => text().map(const GenresConverter()).nullable()();
  IntColumn get collectionId => integer().references(
        UserCollections,
        #id,
        onDelete: KeyAction.cascade,
      )();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
