import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'core/bloc_observer.dart';
import 'injection/composition_root.dart';
import 'injection/config.dart';
import 'pages/app.dart';

void main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();

  print('base: ${const Config().itunesApiBaseUrl}');
  final client = http.Client();

  Bloc.observer = NextBlocObserver();
  const config = Config();

  final compositionResult = await const CompositionRoot(config).compose();
  runApp(NextApp(result: compositionResult));
}
