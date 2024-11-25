import '../core/exceptions/empty_query_exception.dart';
import '../core/use_case/params/search_query_param.dart';
import '../core/use_case/use_case.dart';
import '../entities/album_entity.dart';
import '../repositories/album_repository.dart';

final class SearchAlbumUseCase
    extends AsyncUseCase<List<AlbumEntity>, SearchQueryParams> {
  const SearchAlbumUseCase(this.remoteAlbumRepository);

  final RemoteAlbumRepository remoteAlbumRepository;

  @override
  Future<List<AlbumEntity>> execute(SearchQueryParams param) {
    if (param.query.trim().isEmpty) {
      throw EmptyQueryException();
    }

    return remoteAlbumRepository.search(param.query);
  }
}
