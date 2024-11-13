import 'package:drift/drift.dart';

import 'collection_types.dart';

class UserCollections extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength()();
  IntColumn get typeId => integer().references(CollectionTypes, #id)();
}
