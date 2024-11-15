import 'package:itunes_service/itunes_service.dart';
import 'package:rest_service/rest_service.dart';

import '../config.dart';
import '../factories.dart';
import '../global/dependencies_container.dart';
import 'podcast_dependencies_container.dart';

class PodcastDependenciesFactory extends Factory<PodcastDependenciesContainer> {
  PodcastDependenciesFactory({
    required this.dependenciesContainer,
    required this.config,
  });

  final DependenciesContainer dependenciesContainer;
  final Config config;

  @override
  PodcastDependenciesContainer create() {
    final client = HttpRestClient(
      client: dependenciesContainer.httpClient,
      baseUrl: config.itunesApiBaseUrl,
    );
    final dataSource = PodcastDataSourceImpl(client);
    final repository = PodcastRepositoryImpl(dataSource);

    return PodcastDependenciesContainer(
      podcastDataSource: dataSource,
      podcastRepository: repository,
    );
  }
}
