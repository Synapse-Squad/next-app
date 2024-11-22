import '../../../moviedb_service.dart';
import '../mappers/movie_mapper.dart';

class MovieRepositoryImpl implements IMovieRepository {
  MovieRepositoryImpl(this.dataSource);

  final MovieDataSource dataSource;

  @override
  Future<List<MovieEntity>> search(String? query) async {
    final movieDtoList = await dataSource.searchForMovie(query);
    return MovieMapper.toEntity(movieDtoList);
  }
}
