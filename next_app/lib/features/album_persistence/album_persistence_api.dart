import 'dart:async';

import 'bloc/album_persisting_bloc.dart';

abstract interface class AlbumPersistenceApi {}

final class AlbumPersistenceApiImpl implements AlbumPersistenceApi {
  AlbumPersistenceApiImpl(this.bloc);

  final AlbumPersistingBloc bloc;

  Stream<Set<int>> get listen async* {
    await for (var newState in bloc.stream) {
      if (newState is AlbumPersistingSuccess) {
        yield newState.recentlyAddedIds;
      }
    }
  }
}
