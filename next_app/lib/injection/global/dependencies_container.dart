import 'package:http/http.dart' as http;
import 'package:next_database_service/next_database_service.dart';

base class DependenciesContainer {
  const DependenciesContainer({
    required this.httpClient,
    required this.nextDatabase,
  });

  final http.Client httpClient;
  final NextDatabase nextDatabase;
}
