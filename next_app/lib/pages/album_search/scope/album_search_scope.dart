import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/album_persistence/album_persistence_api.dart';
import '../../../features/album_persistence/bloc/album_persisting_bloc.dart';
import '../../../features/album_search/bloc/album_search_bloc.dart';
import '../../../injection/album/album_dependencies_container.dart';
import '../../../injection/album/album_dependencies_factory.dart';
import '../../../injection/widget/dependencies_scope.dart';

class AlbumSearchScope extends StatefulWidget {
  const AlbumSearchScope({super.key, required this.builder});

  final WidgetBuilder builder;

  @override
  State<AlbumSearchScope> createState() => _AlbumSearchScopeState();
}

class _AlbumSearchScopeState extends State<AlbumSearchScope> {
  AlbumDependenciesContainer? _dependencies;

  @override
  void initState() {
    super.initState();

    final global = DependenciesScope.of(context);
    _dependencies = AlbumDependenciesFactory(dependencies: global).create();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            return AlbumPersistingBloc(_dependencies!.albumFacade);
          },
        ),
        BlocProvider(
          create: (context) {
            return AlbumSearchBloc(
              albumFacade: _dependencies!.albumFacade,
              albumPersistenceApi: AlbumPersistenceApiImpl(
                context.read<AlbumPersistingBloc>(),
              ),
            );
          },
        ),
      ],
      child: Builder(
        builder: (context) => widget.builder(context),
      ),
    );
  }

  @override
  void dispose() {
    _dependencies = null;
    super.dispose();
  }
}
