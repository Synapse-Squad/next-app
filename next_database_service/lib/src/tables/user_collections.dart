import 'package:domain/domain.dart';
import 'package:drift/drift.dart';

class UserCollections extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength()();
  IntColumn get typeId => intEnum<CollectionTypes>()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {title, typeId}
      ];
}
