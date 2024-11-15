import 'package:itunes_service/itunes_service.dart';

base class AlbumDependenciesContainer {
  const AlbumDependenciesContainer({
    required this.albumDataSource,
    required this.albumRepository,
  });

  final AlbumDataSource albumDataSource;
  final IAlbumRepository albumRepository;
}
