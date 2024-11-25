import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/album/album.dart';
import '../../../injection/album/local_album_dependencies_factory.dart';
import '../../../injection/album/remote_album_dependencies_factory.dart';
import '../../../injection/widget/dependencies_scope.dart';

class AlbumSearchScope extends StatefulWidget {
  const AlbumSearchScope({super.key, required this.builder});

  final WidgetBuilder builder;

  @override
  State<AlbumSearchScope> createState() => _AlbumSearchScopeState();
}

class _AlbumSearchScopeState extends State<AlbumSearchScope> {
  LocalAlbumDependenciesContainer? _localDependencies;
  RemoteAlbumDependenciesContainer? _remoteDependencies;

  @override
  void initState() {
    super.initState();

    final global = DependenciesScope.of(context);
    _localDependencies =
        LocalAlbumDependenciesFactory(dependencies: global).create();
    _remoteDependencies =
        RemoteAlbumDependenciesFactory(dependencies: global).create();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            return AlbumPersistingBloc(
              persistAlbumUseCase: _localDependencies!.persistAlbumUseCase,
              deleteAlbumUseCase: _localDependencies!.deleteAlbumUseCase,
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return AlbumSearchBloc(
              searchAlbumUseCase: _remoteDependencies!.searchAlbumUseCase,
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
    _localDependencies = null;
    _remoteDependencies = null;
    super.dispose();
  }
}
