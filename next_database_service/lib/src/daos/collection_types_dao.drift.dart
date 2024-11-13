// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:next_database_service/src/next_database.dart' as i1;
import 'package:next_database_service/src/tables/collection_types.drift.dart'
    as i2;
import 'package:drift/internal/modular.dart' as i3;

mixin $CollectionTypesDaoMixin on i0.DatabaseAccessor<i1.NextDatabase> {
  i2.$CollectionTypesTable get collectionTypes =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i2.$CollectionTypesTable>('collection_types');
}
