import '../dtos/album_dto.dart';
import '../entities/album_entity.dart';

class AlbumMapper {
  static List<AlbumEntity> toEntity(List<AlbumDto> dto) {
    return dto.map((dto) {
      return AlbumEntity(
        artistName: dto.artistName,
        collectionName: dto.collectionName,
        collectionViewUrl: dto.collectionViewUrl,
        artworkUrl60: dto.artworkUrl60,
        trackCount: dto.trackCount,
        copyright: dto.copyright,
        releaseDate: dto.releaseDate,
        primaryGenreName: dto.primaryGenreName,
      );
    }).toList();
  }
}
