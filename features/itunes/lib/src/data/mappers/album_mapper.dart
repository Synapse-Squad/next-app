import '../../domain/entities/album_entity.dart';
import '../dtos/album_dto.dart';

class AlbumMapper {
  static List<AlbumEntity> toEntity(List<AlbumDto> dto) {
    return dto.map((dto) {
      return AlbumEntity(
        id: dto.collectionId,
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
