import 'package:either/either.dart';

import '../entities/podcast_entity.dart';

abstract interface class RemotePodcastRepository {
  Future<Either<Failure, List<PodcastEntity>>> search(String query);
}

abstract interface class LocalPodcastRepository {}
