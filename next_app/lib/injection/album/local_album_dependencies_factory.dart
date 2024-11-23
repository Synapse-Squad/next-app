import 'package:domain/domain.dart';
import 'package:next_database_service/next_database_service.dart';

import '../factories.dart';
import '../global/dependencies_container.dart';
import 'local_album_dependencies_container.dart';

export 'local_album_dependencies_container.dart';

class LocalAlbumDependenciesFactory
    extends Factory<LocalAlbumDependenciesContainer> {
  LocalAlbumDependenciesFactory({required this.dependencies});

  final DependenciesContainer dependencies;

  @override
  LocalAlbumDependenciesContainer create() {
    final dao = AlbumsDao(dependencies.nextDatabase);
    final repository = LocalAlbumRepositoryImpl(dao);
    final persistUseCase = PersistAlbumUseCase(repository);
    final deleteUseCase = DeleteAlbumUseCase(repository);

    return LocalAlbumDependenciesContainer(
      albumsDao: dao,
      localAlbumRepository: repository,
      persistAlbumUseCase: persistUseCase,
      deleteAlbumUseCase: deleteUseCase,
    );
  }
}
