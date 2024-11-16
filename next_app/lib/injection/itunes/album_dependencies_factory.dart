import 'package:facades/facades.dart';
import 'package:itunes_service/itunes_service.dart';
import 'package:next_database_service/next_database_service.dart';
import 'package:rest_service/rest_service.dart';

import '../config.dart';
import '../factories.dart';
import '../global/dependencies_container.dart';
import 'album_dependencies_container.dart';

class AlbumDependenciesFactory extends Factory<AlbumDependenciesContainer> {
  AlbumDependenciesFactory({
    required this.dependencies,
    required this.config,
  });

  final DependenciesContainer dependencies;
  final Config config;

  @override
  AlbumDependenciesContainer create() {
    print('url: ${config.itunesApiBaseUrl}');
    final client = HttpRestClient(
      client: dependencies.httpClient,
      baseUrl: config.itunesApiBaseUrl,
    );

    final albumDataSource = AlbumDataSourceImpl(client);

    final albumRepository = AlbumRepositoryImpl(
      albumDataSource: albumDataSource,
    );

    final albumsDao = AlbumsDao(dependencies.nextDatabase);

    final albumFacade = AlbumFacade(
      albumRepository: albumRepository,
      albumsDao: albumsDao,
    );

    return AlbumDependenciesContainer(
      albumDataSource: albumDataSource,
      albumRepository: albumRepository,
      albumFacade: albumFacade,
    );
  }
}
