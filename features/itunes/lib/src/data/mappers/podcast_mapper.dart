import '../../domain/entities/genre_entity.dart';
import '../../domain/entities/podcast_entity.dart';
import '../dtos/podcast_dto.dart';

class PodcastMapper {
  static List<PodcastEntity> toEntity(List<PodcastDto> dto) {
    return dto.map(
      (dto) {
        return PodcastEntity(
          artworkUrl600: dto.artworkUrl600,
          collectionName: dto.collectionName,
          collectionViewUrl: dto.collectionViewUrl,
          genres: dto.genres
              ?.map((genre) => GenreEntity(id: genre.id, name: genre.name))
              .toList(),
          releaseDate: dto.releaseDate,
          shortDescription: dto.shortDescription,
          trackName: dto.trackName,
          trackTimeMillis: dto.trackTimeMillis,
          trackViewUrl: dto.trackViewUrl,
        );
      },
    ).toList();
  }
}
