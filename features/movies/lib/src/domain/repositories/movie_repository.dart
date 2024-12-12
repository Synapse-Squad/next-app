import '../entities/movie_entity.dart';

abstract interface class IMovieRepository {
  Future<List<MovieEntity>> search(String? query);
}
