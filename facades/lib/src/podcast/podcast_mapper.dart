import 'package:drift/drift.dart';
import 'package:itunes_service/itunes_service.dart';
import 'package:next_database_service/next_database_service.dart';

class PodcastMapper {
  const PodcastMapper._();

  static PodcastsCompanion toCompanion({
    required int collectionId,
    required PodcastEntity podcast,
  }) {
    return PodcastsCompanion(
      artworkUrl60: Value(podcast.artworkUrl600),
      trackName: Value(podcast.trackName),
      description: Value(podcast.shortDescription),
      releaseDate: Value(podcast.releaseDate),
      collectionName: Value(podcast.collectionName),
      collectionViewUrl: Value(podcast.collectionViewUrl),
      trackViewUrl: Value(podcast.trackViewUrl),
      collectionId: Value(collectionId),
      trackTimeMillis: Value(podcast.trackTimeMillis),
      genres: Value(
        podcast.genres?.map((genre) {
          return GenreDto(id: genre.id, name: genre.name);
        }).toList(),
      ),
    );
  }

  static List<PodcastEntity> toEntityList(List<Podcast> podcasts) {
    return podcasts.map(PodcastMapper.toEntity).toList();
  }

  static PodcastEntity toEntity(Podcast podcast) {
    return PodcastEntity(
      artworkUrl600: podcast.artworkUrl60,
      genres: podcast.genres
          ?.map((genre) => GenreEntity(id: genre.id, name: genre.name))
          .toList(),
      trackName: podcast.trackName,
      shortDescription: podcast.description,
      releaseDate: podcast.releaseDate,
      collectionViewUrl: podcast.collectionViewUrl,
      trackViewUrl: podcast.trackViewUrl,
      trackTimeMillis: podcast.trackTimeMillis,
      collectionName: podcast.collectionName,
    );
  }
}
