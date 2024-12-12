import 'package:either/either.dart';

import '../entities/album_entity.dart';
import '../params/search_query_param.dart';
import '../repositories/album_repository.dart';

final class SearchAlbumUseCase {
  const SearchAlbumUseCase(this.remoteAlbumRepository);

  final RemoteAlbumRepository remoteAlbumRepository;

  Future<Either<Failure, List<AlbumEntity>>> call(SearchQueryParams param) {
    return remoteAlbumRepository.search(param.query);
  }
}
