import 'package:domain/domain.dart';
import 'package:itunes_service/itunes_service.dart';

import '../factories.dart';
import '../global/dependencies_container.dart';
import 'remote_album_dependencies_container.dart';

export 'remote_album_dependencies_container.dart';

class RemoteAlbumDependenciesFactory
    extends Factory<RemoteAlbumDependenciesContainer> {
  RemoteAlbumDependenciesFactory({required this.dependencies});

  final DependenciesContainer dependencies;

  @override
  RemoteAlbumDependenciesContainer create() {
    final dataSource = AlbumDataSourceImpl(dependencies.itunesClient);
    final repository = AlbumRepositoryImpl(albumDataSource: dataSource);
    final useCase = SearchAlbumUseCase(repository);

    return RemoteAlbumDependenciesContainer(
      albumDataSource: dataSource,
      remoteAlbumRepository: repository,
      searchAlbumUseCase: useCase,
    );
  }
}
