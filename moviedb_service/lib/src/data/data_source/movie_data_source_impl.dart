import 'package:rest_service/rest_service.dart';

import '../../../moviedb_service.dart';
import '../dtos/movie_dto.dart';

class MovieDataSourceImpl implements MovieDataSource {
  MovieDataSourceImpl(this.client);

  final HttpRestClient client;

  @override
  Future<List<MovieDto>> searchForMovie(String? query) async {
    final response = await client.get(
      '/search/movie',
      headers: {
        'Authorization':
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZWM2ZTlhODRhZTVhZjhkMTc3NTE3ZTM3NTRiMjgxNSIsIm5iZiI6MTczMTU4NDE2Ny43NDMwMTYsInN1YiI6IjY3MmUzYWMzZjcwMmQ0M2VlYTg1MmFjNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Auj2erdU6K7WDbJN83QgDSdg9GqCsUNGJfnFz0Tzvz0"
      },
      queryParameters: {
        'query': query,
      },
    );

    final movies = response?['results'] as List<dynamic>?;

    if (response == null || movies == null || movies.isEmpty) {
      throw MovieNotFoundException();
    }

    final movieDtoList = movies
        .map(
          (movie) => MovieDto.fromJson(movie),
        )
        .toList();

    return movieDtoList.length > 10
        ? movieDtoList.sublist(0, 10)
        : movieDtoList;
  }
}
