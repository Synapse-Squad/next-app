import '../../domain/entities/podcast_entity.dart';
import '../../domain/repositories/podcast_repository.dart';
import '../data_source/podcast_data_source.dart';
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
