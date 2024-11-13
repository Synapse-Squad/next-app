import 'package:drift/drift.dart';

class CollectionTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}
