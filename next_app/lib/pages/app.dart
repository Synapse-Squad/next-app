import 'package:flutter/material.dart';

import '../injection/composition_result.dart';
import '../injection/widget/dependencies_scope.dart';
import 'routing/router.dart';

class NextApp extends StatelessWidget {
  const NextApp({
    super.key,
    required this.result,
  });

  final CompositionResult result;

  @override
  Widget build(BuildContext context) {
    return DependenciesScope(
      dependencies: result.dependencies,
      child: MaterialApp.router(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
          ),
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            color: Colors.black,
            foregroundColor: Colors.white,
            //other options
          ),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
