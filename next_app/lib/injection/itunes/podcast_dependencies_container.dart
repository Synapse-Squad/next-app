import 'package:itunes_service/itunes_service.dart';

base class PodcastDependenciesContainer {
  const PodcastDependenciesContainer({
    required this.podcastDataSource,
    required this.podcastRepository,
  });

  final PodcastDataSource podcastDataSource;
  final IPodcastRepository podcastRepository;
}
