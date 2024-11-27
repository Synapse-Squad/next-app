import '../entities/album_entity.dart';
import '../params/search_query_param.dart';
import '../repositories/album_repository.dart';

final class SearchAlbumUseCase {
  const SearchAlbumUseCase(this.remoteAlbumRepository);

  final RemoteAlbumRepository remoteAlbumRepository;

  Future<List<AlbumEntity>> call(SearchQueryParams param) {
    // if (param.query.trim().isEmpty) {
    //   throw EmptyQueryException();
    // }

    return remoteAlbumRepository.search(param.query);
  }
}
