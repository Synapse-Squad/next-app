import 'package:domain/domain.dart';
import 'package:next_database_service/next_database_service.dart';

base class LocalAlbumDependenciesContainer {
  const LocalAlbumDependenciesContainer({
    required this.albumsDao,
    required this.localAlbumRepository,
    required this.persistAlbumUseCase,
    required this.deleteAlbumUseCase,
  });

  final AlbumsDao albumsDao;
  final LocalAlbumRepository localAlbumRepository;
  final PersistAlbumUseCase persistAlbumUseCase;
  final DeleteAlbumUseCase deleteAlbumUseCase;
}
