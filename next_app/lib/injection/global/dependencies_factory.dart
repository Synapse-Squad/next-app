import 'package:http/http.dart' as http;
import 'package:next_database_service/next_database_service.dart';
import 'package:rest_service/rest_service.dart';

import '../config.dart';
import '../factories.dart';
import 'dependencies_container.dart';

class GlobalDependenciesFactory extends Factory<DependenciesContainer> {
  const GlobalDependenciesFactory(this.config);

  final Config config;

  @override
  DependenciesContainer create() {
    final httpClient = http.Client();
    final nextDatabase = NextDatabase();

    final movieClient = HttpRestClient(
      client: httpClient,
      baseUrl: config.moviesDbApiBaseUrl,
      headers: () async {
        return {
          'Authorization': 'Bearer ${config.moviesDbBearerToken}',
        };
      },
    );

    final bookClient = HttpRestClient(
      client: httpClient,
      baseUrl:
          '${config.googleBooksApiBaseUrl}?key=${config.googleBooksApiKey}',
    );

    final itunesClient = HttpRestClient(
      client: httpClient,
      baseUrl: config.itunesApiBaseUrl,
    );

    return DependenciesContainer(
      httpClient: httpClient,
      nextDatabase: nextDatabase,
      movieClient: movieClient,
      bookClient: bookClient,
      itunesClient: itunesClient,
    );
  }
}
