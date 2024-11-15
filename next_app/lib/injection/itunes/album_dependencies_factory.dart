import 'package:itunes_service/itunes_service.dart';
import 'package:rest_service/rest_service.dart';

import '../config.dart';
import '../factories.dart';
import '../global/dependencies_container.dart';
import 'album_dependencies_container.dart';

class AlbumDependenciesFactory extends Factory<AlbumDependenciesContainer> {
  AlbumDependenciesFactory({
    required this.dependenciesContainer,
    required this.config,
  });

  final DependenciesContainer dependenciesContainer;
  final Config config;

  @override
  AlbumDependenciesContainer create() {
    final client = HttpRestClient(
      client: dependenciesContainer.httpClient,
      baseUrl: config.itunesApiBaseUrl,
    );
    final albumDataSource = AlbumDataSourceImpl(client);
    final albumRepository = AlbumRepositoryImpl(
      albumDataSource: albumDataSource,
    );

    return AlbumDependenciesContainer(
      albumDataSource: albumDataSource,
      albumRepository: albumRepository,
    );
  }
}
