import 'package:facades/src/album/album_mapper.dart';
import 'package:itunes_service/itunes_service.dart';
import 'package:next_database_service/next_database_service.dart';

abstract interface class IAlbumFacade {
  /// search for album in the remote database
  Future<void> searchForAlbum(String query);

  /// gets user selection in type of [AlbumEntity]
  /// converts it to [AlbumsCompanion]
  /// and persists in the local database
  Future<int> persistSelectedAlbum({
    required int collectionId,
    required AlbumEntity album,
  });

  /// get local albums of user within the given [collectionId]
  Future<List<AlbumEntity>> getUserAlbumsByCollectionId(
    int collectionId, {
    OrderOptions? orderOption,
  });

  /// search for user's album in the local database
  Future<List<AlbumEntity>> searchForUserAlbum({
    required String query,
    required int collectionId,
  });

  /// delete album in the given id from the local database
  Future<int> deleteAlbum(int albumId);

  /// returns details of album within the given id from the local database
  Future<AlbumEntity> getUserAlbumDetails(int albumId);

  Future<void> markAsListened(int albumId);

  Future<void> markAsNotListened(int albumId);
}

final class AlbumFacade implements IAlbumFacade {
  const AlbumFacade({
    required this.albumRepository,
    required this.albumsDao,
  });

  final IAlbumRepository albumRepository;
  final AlbumsDao albumsDao;

  @override
  Future<void> searchForAlbum(String query) => albumRepository.search(query);

  @override
  Future<int> persistSelectedAlbum({
    required int collectionId,
    required AlbumEntity album,
  }) async {
    return albumsDao.add(
      AlbumMapper.toCompanion(collectionId: collectionId, album: album),
    );
  }

  @override
  Future<List<AlbumEntity>> getUserAlbumsByCollectionId(
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
  Future<List<AlbumEntity>> searchForUserAlbum({
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
  Future<int> deleteAlbum(int albumId) => albumsDao.deleteById(albumId);

  @override
  Future<AlbumEntity> getUserAlbumDetails(int albumId) async {
    final albumRow = await albumsDao.get(albumId);
    return AlbumMapper.toEntity(albumRow);
  }

  @override
  Future<void> markAsListened(int albumId) => albumsDao.markAsListened(albumId);

  @override
  Future<void> markAsNotListened(int albumId) =>
      albumsDao.markAsNotListened(albumId);
}
