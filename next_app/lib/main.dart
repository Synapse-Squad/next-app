import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_books_service/google_books_service.dart';
import 'package:rest_service/rest_service.dart';

import 'core/bloc_observer.dart';
import 'injection/composition_root.dart';
import 'injection/config.dart';
import 'pages/app.dart';

void main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = NextBlocObserver();
  const config = Config();
  final compositionResult = await const CompositionRoot(config).compose();

  final dependencies = compositionResult.dependencies;
  final client = HttpRestClient(
    client: dependencies.httpClient,
    baseUrl: '${config.googleBooksApiBaseUrl}?key=${config.googleBooksApiKey}',
  );
  final dataSource = GoogleBookDataSourceImpl(client: client);
  final repository = GoogleBookRepositoryImpl(bookDataSource: dataSource);

  final result = await repository.search('Çərpələng');
  print(result);

  runApp(NextApp(result: compositionResult));
}
