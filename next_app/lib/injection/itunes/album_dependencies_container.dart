import 'package:facades/facades.dart';
import 'package:itunes_service/itunes_service.dart';

base class AlbumDependenciesContainer {
  const AlbumDependenciesContainer({
    required this.albumDataSource,
    required this.albumRepository,
    required this.albumFacade,
  });

  final AlbumDataSource albumDataSource;
  final IAlbumRepository albumRepository;
  final AlbumFacadeType albumFacade;
}
