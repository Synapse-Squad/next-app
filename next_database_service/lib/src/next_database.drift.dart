// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:next_database_service/src/tables/collection_types.drift.dart'
    as i1;
import 'package:next_database_service/src/tables/user_collections.drift.dart'
    as i2;
import 'package:next_database_service/src/tables/movies.drift.dart' as i3;
import 'package:next_database_service/src/tables/albums.drift.dart' as i4;
import 'package:next_database_service/src/tables/podcasts.drift.dart' as i5;
import 'package:next_database_service/src/daos/collection_types_dao.dart' as i6;
import 'package:next_database_service/src/next_database.dart' as i7;

abstract class $NextDatabase extends i0.GeneratedDatabase {
  $NextDatabase(i0.QueryExecutor e) : super(e);
  late final i1.$CollectionTypesTable collectionTypes =
      i1.$CollectionTypesTable(this);
  late final i2.$UserCollectionsTable userCollections =
      i2.$UserCollectionsTable(this);
  late final i3.$MoviesTable movies = i3.$MoviesTable(this);
  late final i4.$AlbumsTable albums = i4.$AlbumsTable(this);
  late final i5.$PodcastsTable podcasts = i5.$PodcastsTable(this);
  late final i6.CollectionTypesDao collectionTypesDao =
      i6.CollectionTypesDao(this as i7.NextDatabase);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities =>
      [collectionTypes, userCollections, movies, albums, podcasts];
  @override
  i0.StreamQueryUpdateRules get streamUpdateRules =>
      const i0.StreamQueryUpdateRules(
        [
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('user_collections',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('movies', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('user_collections',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('albums', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('user_collections',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('podcasts', kind: i0.UpdateKind.delete),
            ],
          ),
        ],
      );
  @override
  i0.DriftDatabaseOptions get options =>
      const i0.DriftDatabaseOptions(storeDateTimeAsText: true);
}
