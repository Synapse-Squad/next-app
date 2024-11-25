import 'package:flutter/material.dart';

import '../injection/composition_result.dart';
import '../injection/widget/dependencies_scope.dart';
import 'collections/collections_page.dart';

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
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CollectionsPage(),
      ),
    );
  }
}
