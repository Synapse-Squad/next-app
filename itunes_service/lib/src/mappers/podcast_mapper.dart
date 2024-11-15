import 'package:itunes_service/src/dtos/podcast_dto.dart';
import 'package:itunes_service/src/entities/podcast_entity.dart';

class PodcastMapper {
  static List<PodcastEntity> toEntity(List<PodcastDto> dtoList) {
    return dtoList.map(
      (podcast) {
        return PodcastEntity(
          artworkUrl600: podcast.artworkUrl600,
          collectionName: podcast.collectionName,
          collectionViewUrl: podcast.collectionViewUrl,
          genreName: podcast.genres != null && podcast.genres!.isNotEmpty
              ? podcast.genres!.first.name
              : null,
          releaseDate: podcast.releaseDate,
          shortDescription: podcast.shortDescription,
          trackName: podcast.trackName,
          trackTimeMillis: podcast.trackTimeMillis,
          trackViewUrl: podcast.trackViewUrl,
        );
      },
    ).toList();
  }
}
