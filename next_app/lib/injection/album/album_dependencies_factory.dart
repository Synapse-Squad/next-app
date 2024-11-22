import 'package:facades/facades.dart';
import 'package:itunes_service/itunes_service.dart';
import 'package:next_database_service/next_database_service.dart';

import '../factories.dart';
import '../global/dependencies_container.dart';
import 'album_dependencies_container.dart';

class AlbumDependenciesFactory extends Factory<AlbumDependenciesContainer> {
  AlbumDependenciesFactory({required this.dependencies});

  final DependenciesContainer dependencies;

  @override
  AlbumDependenciesContainer create() {
    final albumDataSource = AlbumDataSourceImpl(dependencies.itunesClient);

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
