import '../entities/album_entity.dart';

abstract interface class ItunesRepository {
  Future<List<AlbumEntity>> searchForAlbum(String query);
}
