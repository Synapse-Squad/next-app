import 'package:domain/domain.dart';
import 'package:itunes_service/itunes_service.dart';

base class RemoteAlbumDependenciesContainer {
  const RemoteAlbumDependenciesContainer({
    required this.albumDataSource,
    required this.remoteAlbumRepository,
    required this.searchAlbumUseCase,
  });

  final AlbumDataSource albumDataSource;
  final RemoteAlbumRepository remoteAlbumRepository;
  final SearchAlbumUseCase searchAlbumUseCase;
}
