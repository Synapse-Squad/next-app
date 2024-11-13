import '../dtos/album_dto.dart';

abstract interface class AlbumDataSource {
  Future<List<AlbumDto>> searchForAlbum(String query);
}
