import 'package:http/http.dart' as http;
import 'package:next_app/injection/global/dependencies_container.dart';
import 'package:next_database_service/next_database_service.dart';

import '../factories.dart';

class GlobalDependenciesFactory extends Factory<DependenciesContainer> {
  // /// Application configuration
  // final Config config;

  @override
  DependenciesContainer create() {
    final httpClient = http.Client();
    final nextDatabase = NextDatabase();

    return DependenciesContainer(
      httpClient: httpClient,
      nextDatabase: nextDatabase,
    );
  }
}
