import 'package:domain/domain.dart';

import '../daos/albums_dao.dart';
import '../extensions/album_entity_ext.dart';

final class LocalAlbumRepositoryImpl implements LocalAlbumRepository {
  const LocalAlbumRepositoryImpl(this.albumsDao);

  final AlbumsDao albumsDao;

  @override
  Future<int> persist(AlbumPersistingParams params) async {
    final companion = params.album.toCompanion(params.categoryId);
    return albumsDao.add(companion);
  }

  @override
  Future<int> delete(AlbumDeleteParams params) =>
      albumsDao.deleteById(params.album.id!);
}
