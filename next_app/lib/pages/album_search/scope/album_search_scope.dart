import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/album_persistence/album_persistence_api.dart';
import '../../../features/album_persistence/bloc/album_persisting_bloc.dart';
import '../../../features/album_search/bloc/album_search_bloc.dart';
import '../../../injection/config.dart';
import '../../../injection/provider_scope/provider_scope.dart';
import 'album_search_dependencies_factory.dart';

class AlbumSearchScope extends StatelessWidget {
  const AlbumSearchScope({
    super.key,
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      dependencyContainerBuilder: (dependencies) {
        return AlbumSearchDependenciesFactory(
          dependencies: dependencies,
          config: const Config(),
        ).create();
      },
      widgetBuilderWithDependency: (context, dependencies, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) {
                return AlbumPersistingBloc(dependencies.albumFacade);
              },
            ),
            BlocProvider(
              create: (context) {
                return AlbumSearchBloc(
                  albumFacade: dependencies.albumFacade,
                  albumPersistenceApi: AlbumPersistenceApiImpl(
                    context.read<AlbumPersistingBloc>(),
                  ),
                );
              },
            ),
          ],
          child: child,
        );
      },
      child: Builder(builder: (context) => builder(context)),
    );
  }
}
