import 'dart:async';

import 'bloc/album_persisting_bloc.dart';

abstract interface class AlbumPersistenceApi {
  Stream<Set<int>> get idsStream;
}

final class AlbumPersistenceApiImpl implements AlbumPersistenceApi {
  AlbumPersistenceApiImpl(this.bloc);

  final AlbumPersistingBloc bloc;

  @override
  Stream<Set<int>> get idsStream async* {
    await for (var newState in bloc.stream) {
      yield newState.recentlyAddedIds;
    }
  }
}
