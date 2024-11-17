import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection/config.dart';
import '../../injection/itunes/album_dependencies_factory.dart';
import '../../injection/provider_scope/provider_scope.dart';
import 'bloc/album_search_bloc.dart';
import 'view/album_search_view.dart';

class AlbumSearchScope extends StatelessWidget {
  const AlbumSearchScope({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      dependencyContainerBuilder: (dependencies) {
        return AlbumDependenciesFactory(
          dependencies: dependencies,
          config: const Config(),
        ).create();
      },
      widgetBuilderWithDependency: (context, dependencies, child) {
        return BlocProvider(
          create: (_) {
            return AlbumSearchBloc(dependencies.albumFacade);
          },
          child: child,
        );
      },
      child: const AlbumSearchView(),
    );
  }
}
