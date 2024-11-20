import 'package:moviedb_service/src/data/dtos/movie_dto.dart';
import 'package:moviedb_service/src/domain/entities/movie_entity.dart';

class MovieMapper {
  static List<MovieEntity> toEntity(List<MovieDto> movieDtoList) {
    return movieDtoList.map(
      (movieDto) {
        return MovieEntity(
          id: movieDto.id,
          overview: movieDto.overview,
          posterPath: movieDto.posterPath,
          releaseDate: movieDto.releaseDate,
          title: movieDto.title,
          voteAverage: movieDto.voteAverage,
        );
      },
    ).toList();
  }
}
