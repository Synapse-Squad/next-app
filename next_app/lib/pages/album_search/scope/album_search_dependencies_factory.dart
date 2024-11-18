import 'package:facades/facades.dart';
import 'package:itunes_service/itunes_service.dart';
import 'package:next_database_service/next_database_service.dart';
import 'package:rest_service/rest_service.dart';

import '../../../injection/config.dart';
import '../../../injection/factories.dart';
import '../../../injection/global/dependencies_container.dart';
import 'album_dependencies_container.dart';

class AlbumSearchDependenciesFactory
    extends Factory<AlbumSearchDependenciesContainer> {
  AlbumSearchDependenciesFactory({
    required this.dependencies,
    required this.config,
  });

  final DependenciesContainer dependencies;
  final Config config;

  @override
  AlbumSearchDependenciesContainer create() {
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

    return AlbumSearchDependenciesContainer(
      albumDataSource: albumDataSource,
      albumRepository: albumRepository,
      albumFacade: albumFacade,
    );
  }
}
