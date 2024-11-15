import 'package:itunes_service/itunes_service.dart';
import 'package:rest_service/rest_service.dart';

import '../config.dart';
import '../factories.dart';
import '../global/dependencies_container.dart';
import 'itunes_dependencies_container.dart';

class ItunesDependenciesFactory extends Factory<ItunesDependenciesContainer> {
  ItunesDependenciesFactory({
    required this.dependenciesContainer,
    required this.config,
  });

  final DependenciesContainer dependenciesContainer;
  final Config config;

  @override
  ItunesDependenciesContainer create() {
    final client = HttpRestClient(
      client: dependenciesContainer.httpClient,
      baseUrl: config.itunesApiBaseUrl,
    );
    final albumDataSource = AlbumDataSourceImpl(client);
    final podcastDataSource = PodcastDataSourceImpl(client: client);
    final itunesRepository = ItunesRepositoryImpl(
      albumDataSource: albumDataSource,
      podcastDataSource: podcastDataSource,
    );

    return ItunesDependenciesContainer(
      albumDataSource: albumDataSource,
      itunesRepository: itunesRepository,
    );
  }
}
