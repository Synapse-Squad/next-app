import 'package:http/http.dart' as http;
import 'package:next_database_service/next_database_service.dart';
import 'package:rest_service/rest_service.dart';

base class CoreModule {
  const CoreModule({
    required this.httpClient,
    required this.nextDatabase,
    required this.movieClient,
    required this.bookClient,
    required this.itunesClient,
  });

  final http.Client httpClient;
  final NextDatabase nextDatabase;
  final HttpRestClient movieClient;
  final HttpRestClient bookClient;
  final HttpRestClient itunesClient;
}
