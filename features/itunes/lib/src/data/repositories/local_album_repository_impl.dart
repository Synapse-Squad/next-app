import 'package:either/either.dart';
import 'package:itunes/src/core/extensions/album_entity_ext.dart';
import 'package:next_database_service/next_database_service.dart';

import '../../domain/params/album_delete_params.dart';
import '../../domain/params/album_persisting_params.dart';
import '../../domain/repositories/album_repository.dart';

final class LocalAlbumRepositoryImpl implements LocalAlbumRepository {
  const LocalAlbumRepositoryImpl(this.albumsDao);

  final AlbumsDao albumsDao;

  @override
  Future<Either<Failure, int>> persist(AlbumPersistingParams params) async {
    try {
      final companion = params.album.toCompanion(params.categoryId);
      final id = await albumsDao.add(companion);
      return Right(id);
    } catch (e, s) {
      return Left(
        Failure.database(
          'Something went wrong while writing to table',
          e,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, int>> delete(AlbumDeleteParams params) async {
    try {
      final id = await albumsDao.deleteById(params.album.id!);
      return Right(id);
    } catch (_) {}
  }
}
