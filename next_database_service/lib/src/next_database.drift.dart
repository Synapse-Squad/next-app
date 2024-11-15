// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:next_database_service/src/tables/user_collections.drift.dart'
    as i1;
import 'package:next_database_service/src/tables/movies.drift.dart' as i2;
import 'package:next_database_service/src/tables/albums.drift.dart' as i3;
import 'package:next_database_service/src/tables/podcasts.drift.dart' as i4;
import 'package:next_database_service/src/tables/books.drift.dart' as i5;
import 'package:next_database_service/src/daos/user_collections_dao.dart' as i6;
import 'package:next_database_service/src/next_database.dart' as i7;
import 'package:next_database_service/src/daos/albums_dao.dart' as i8;
import 'package:next_database_service/src/daos/podcasts_dto.dart' as i9;
import 'package:next_database_service/src/daos/books_dto.dart' as i10;

abstract class $NextDatabase extends i0.GeneratedDatabase {
  $NextDatabase(i0.QueryExecutor e) : super(e);
  late final i1.$UserCollectionsTable userCollections =
      i1.$UserCollectionsTable(this);
  late final i2.$MoviesTable movies = i2.$MoviesTable(this);
  late final i3.$AlbumsTable albums = i3.$AlbumsTable(this);
  late final i4.$PodcastsTable podcasts = i4.$PodcastsTable(this);
  late final i5.$BooksTable books = i5.$BooksTable(this);
  late final i6.UserCollectionsDao userCollectionsDao =
      i6.UserCollectionsDao(this as i7.NextDatabase);
  late final i8.AlbumsDao albumsDao = i8.AlbumsDao(this as i7.NextDatabase);
  late final i9.PodcastsDto podcastsDto =
      i9.PodcastsDto(this as i7.NextDatabase);
  late final i10.BooksDto booksDto = i10.BooksDto(this as i7.NextDatabase);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities =>
      [userCollections, movies, albums, podcasts, books];
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
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('user_collections',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('books', kind: i0.UpdateKind.delete),
            ],
          ),
        ],
      );
  @override
  i0.DriftDatabaseOptions get options =>
      const i0.DriftDatabaseOptions(storeDateTimeAsText: true);
}
