import '../../../moviedb_service.dart';
import '../dtos/movie_dto.dart';

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
