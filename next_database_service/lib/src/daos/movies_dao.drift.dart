// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:next_database_service/src/next_database.dart' as i1;
import 'package:next_database_service/src/tables/user_collections.drift.dart'
    as i2;
import 'package:drift/internal/modular.dart' as i3;
import 'package:next_database_service/src/tables/movies.drift.dart' as i4;

mixin $MoviesDaoMixin on i0.DatabaseAccessor<i1.NextDatabase> {
  i2.$UserCollectionsTable get userCollections =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i2.$UserCollectionsTable>('user_collections');
  i4.$MoviesTable get movies => i3.ReadDatabaseContainer(attachedDatabase)
      .resultSet<i4.$MoviesTable>('movies');
}
