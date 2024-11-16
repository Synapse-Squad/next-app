import 'package:drift/drift.dart';
import 'package:itunes_service/itunes_service.dart';
import 'package:next_database_service/next_database_service.dart';

class AlbumMapper {
  const AlbumMapper._();

  static AlbumsCompanion toCompanion({
    required int collectionId,
    required AlbumEntity album,
  }) {
    return AlbumsCompanion(
      artistName: Value(album.artistName),
      collectionName: Value(album.collectionName),
      collectionViewUrl: Value(album.collectionViewUrl),
      artworkUrl60: Value(album.artworkUrl60),
      trackCount: Value(album.trackCount),
      copyright: Value(album.copyright),
      releaseDate: Value(album.releaseDate),
      primaryGenreName: Value(album.primaryGenreName),
      collectionId: Value(collectionId),
    );
  }

  static List<AlbumEntity> toEntityList(List<Album> albums) {
    return albums.map(AlbumMapper.toEntity).toList();
  }

  static AlbumEntity toEntity(Album album) {
    return AlbumEntity(
      id: album.id,
      artistName: album.artistName,
      collectionName: album.collectionName,
      collectionViewUrl: album.collectionViewUrl,
      artworkUrl60: album.artworkUrl60,
      trackCount: album.trackCount,
      copyright: album.copyright,
      releaseDate: album.releaseDate,
      primaryGenreName: album.primaryGenreName,
    );
  }
}
