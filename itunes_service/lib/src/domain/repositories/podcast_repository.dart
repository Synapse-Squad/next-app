import '../entities/podcast_entity.dart';

abstract interface class IPodcastRepository {
  Future<List<PodcastEntity>> search(String query);
}
