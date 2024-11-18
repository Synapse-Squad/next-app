import 'package:flutter/material.dart';

import '../injection/composition_result.dart';
import '../injection/widget/dependencies_scope.dart';
import 'album_search/album_search_page.dart';

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
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return const AlbumSearchPage();
                        },
                      ),
                    );
                  },
                  child: const Text('Go to Album Search Page'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
