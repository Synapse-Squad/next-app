import 'package:drift/drift.dart';

import '../../next_database_service.dart';
import '../type_converters/list_converter.dart';
import 'user_collections.dart';

@DataClassName('Book')
class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().nullable()();
  DateTimeColumn get publishedDate => dateTime().nullable()();
  TextColumn get description => text().nullable()();
  IntColumn get pageCount => integer().nullable()();
  TextColumn get smallThumbnail => text().nullable()();
  TextColumn get previewLink => text().nullable()();
  TextColumn get language => text().nullable()();
  TextColumn get authors => text().map(const ListConverter()).nullable()();
  TextColumn get categories => text().map(const ListConverter()).nullable()();
  IntColumn get read =>
      intEnum<ReadStatus>().withDefault(Constant(ReadStatus.notRead.index))();
  IntColumn get userRating => integer().nullable()();
  IntColumn get collectionId => integer().references(
        UserCollections,
        #id,
        onDelete: KeyAction.cascade,
      )();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
