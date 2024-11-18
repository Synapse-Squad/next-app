import 'package:facades/facades.dart';
import 'package:itunes_service/itunes_service.dart';
import 'package:next_database_service/next_database_service.dart';

import 'album_mapper.dart';

typedef IAlbumFacade = IGenericTypedFacade<AlbumEntity, AlbumsCompanion>;

final class AlbumFacade
    implements IGenericTypedFacade<AlbumEntity, AlbumsCompanion> {
  const AlbumFacade({
    required this.albumRepository,
    required this.albumsDao,
  });

  final IAlbumRepository albumRepository;
  final AlbumsDao albumsDao;

  @override
  Future<int> delete(int id) => albumsDao.deleteById(id);

  @override
  Future<List<AlbumEntity>> getListByCollectionId(
    int collectionId, {
    OrderOptions? orderOption,
  }) async {
    final albumRows = await albumsDao.getListByCollectionId(
      collectionId,
      orderOption: orderOption,
    );

    return AlbumMapper.toEntityList(albumRows);
  }

  @override
  Future<AlbumEntity> getLocalItemDetails(int id) async {
    final albumRow = await albumsDao.get(id);
    return AlbumMapper.toEntity(albumRow);
  }

  @override
  Future<void> markAsDone(int id) => albumsDao.markAsListened(id);

  @override
  Future<void> markAsUndone(int id) => albumsDao.markAsNotListened(id);

  @override
  Future<int> persistSelectedItem({
    required int collectionId,
    required AlbumEntity entity,
  }) =>
      albumsDao.add(
        AlbumMapper.toCompanion(
          collectionId: collectionId,
          album: entity,
        ),
      );

  @override
  Future<List<AlbumEntity>> searchForLocalUserList({
    required String query,
    required int collectionId,
  }) async {
    final albumRows = await albumsDao.search(
      query: query,
      collectionId: collectionId,
    );

    return AlbumMapper.toEntityList(albumRows);
  }

  @override
  Future<List<AlbumEntity>> searchForRemoteList(String query) =>
      albumRepository.search(query);
}
