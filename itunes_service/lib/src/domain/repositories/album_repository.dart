import '../entities/album_entity.dart';

abstract interface class IAlbumRepository {
  Future<List<AlbumEntity>> search(String query);
}
