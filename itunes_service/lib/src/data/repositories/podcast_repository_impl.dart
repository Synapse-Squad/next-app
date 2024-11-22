import 'package:domain/domain.dart';

import '../data_sources/podcast_data_source.dart';
import '../mappers/podcast_mapper.dart';

final class PodcastRepositoryImpl implements RemotePodcastRepository {
  const PodcastRepositoryImpl(this.podcastDataSource);

  final PodcastDataSource podcastDataSource;

  @override
  Future<List<PodcastEntity>> search(String query) async {
    final podcastDtoList = await podcastDataSource.searchForPodcast(query);
    return PodcastMapper.toEntity(podcastDtoList);
  }
}
