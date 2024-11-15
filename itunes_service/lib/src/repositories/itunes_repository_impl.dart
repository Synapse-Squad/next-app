import 'package:itunes_service/src/data_source/podcast_data_source.dart';
import 'package:itunes_service/src/entities/podcast_entity.dart';
import 'package:itunes_service/src/mappers/album_mapper.dart';
import 'package:itunes_service/src/mappers/podcast_mapper.dart';

import '../data_source/album_data_source.dart';
import '../entities/album_entity.dart';
import 'itunes_repository.dart';

final class ItunesRepositoryImpl implements ItunesRepository {
  const ItunesRepositoryImpl({
    required this.albumDataSource,
    required this.podcastDataSource,
  });

  final AlbumDataSource albumDataSource;
  final PodcastDataSource podcastDataSource;

  @override
  Future<List<AlbumEntity>> searchForAlbum(String query) async {
    final dto = await albumDataSource.searchForAlbum(query);
    return AlbumMapper.toEntity(dto);
  }

  @override
  Future<List<PodcastEntity>> searchForPodcast(String query) async {
    final podcastDtoList = await podcastDataSource.searchForPodcast(query);

    return PodcastMapper.toEntity(podcastDtoList);
  }
}
