import '../dtos/movie_dto.dart';

abstract interface class MovieDataSource {
  Future<List<MovieDto>> searchForMovie(String? query);
}
