import '../entities/podcast_entity.dart';

abstract interface class RemotePodcastRepository {
  Future<List<PodcastEntity>> search(String query);
}

abstract interface class LocalPodcastRepository {}
