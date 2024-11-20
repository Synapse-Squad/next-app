import 'package:moviedb_service/src/data/data_source/movie_data_source.dart';
import 'package:moviedb_service/src/data/mappers/movie_mapper.dart';
import 'package:moviedb_service/src/domain/entities/movie_entity.dart';
import 'package:moviedb_service/src/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements IMovieRepository {
  MovieRepositoryImpl(this.dataSource);

  final MovieDataSource dataSource;

  @override
  Future<List<MovieEntity>> search(String? query) async {
    final movieDtoList = await dataSource.searchForMovie(query);
    return MovieMapper.toEntity(movieDtoList);
  }
}
