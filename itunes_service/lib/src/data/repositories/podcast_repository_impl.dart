import '../../../itunes_service.dart';
import '../mappers/podcast_mapper.dart';

final class PodcastRepositoryImpl implements IPodcastRepository {
  const PodcastRepositoryImpl(this.podcastDataSource);

  final PodcastDataSource podcastDataSource;

  @override
  Future<List<PodcastEntity>> search(String query) async {
    final podcastDtoList = await podcastDataSource.searchForPodcast(query);
    return PodcastMapper.toEntity(podcastDtoList);
  }
}
