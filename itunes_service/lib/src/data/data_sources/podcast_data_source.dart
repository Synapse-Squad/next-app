import '../dtos/podcast_dto.dart';

abstract interface class PodcastDataSource {
  Future<List<PodcastDto>> searchForPodcast(String query);
}
