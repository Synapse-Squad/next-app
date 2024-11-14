import 'package:itunes_service/itunes_service.dart';

base class ItunesDependenciesContainer {
  const ItunesDependenciesContainer({
    required this.albumDataSource,
    required this.itunesRepository,
  });

  final AlbumDataSource albumDataSource;
  final ItunesRepository itunesRepository;
}
