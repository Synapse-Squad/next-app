import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection/config.dart';
import '../../injection/feature_scope.dart';
import '../../injection/itunes/itunes_dependencies_factory.dart';
import 'bloc/album_search_bloc.dart';
import 'view/album_search_view.dart';

class AlbumSearchScope extends StatelessWidget {
  const AlbumSearchScope({super.key});

  @override
  Widget build(BuildContext context) {
    return FeatureScope(
      dependencyContainerBuilder: (dependencies) {
        return ItunesDependenciesFactory(
          dependenciesContainer: dependencies,
          config: const Config(),
        ).create();
      },
      widgetBuilderWithDependency: (context, dependencies) {
        return BlocProvider(
          create: (_) {
            return AlbumSearchBloc(dependencies.itunesRepository);
          },
          child: const AlbumSearchView(),
        );
      },
    );
  }
}
